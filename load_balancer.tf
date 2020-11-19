locals {
  domain_name = "itd27m01.ru"
}

data "aws_route53_zone" "gitlab_zone" {
  name = local.domain_name
}

module "gitlab_elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "~> 2.0"

  name = "gitlab-loadbalancer"

  subnets         = var.gitlab_public_subnets
  security_groups = var.gitlab_lb_sg_ids
  internal        = false

  listener = [
    {
      instance_port     = "22"
      instance_protocol = "tcp"
      lb_port           = "22"
      lb_protocol       = "tcp"
    },
    {
      instance_port     = "80"
      instance_protocol = "http"
      lb_port           = "80"
      lb_protocol       = "http"
    },
    {
      instance_port     = "80"
      instance_protocol = "http"
      lb_port           = "443"
      lb_protocol       = "https"

      ssl_certificate_id = var.gitlab_acm_certificate_arn
    },
  ]

  health_check = {
    target              = "HTTP:80/users/sign_in"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }

  # ELB target instances
  number_of_instances = length(var.gitlab_private_subnets)
  instances           = [for value in aws_instance.gitlab_app: value.id]
}

resource "aws_route53_record" "gitlab" {
  zone_id = data.aws_route53_zone.gitlab_zone.zone_id
  name    = "gitlab-${var.environment}"
  type    = "A"

  alias {
    name                   = module.gitlab_elb.this_elb_dns_name
    zone_id                = module.gitlab_elb.this_elb_zone_id

    evaluate_target_health = false
  }
}

resource "aws_ssm_parameter" "gitlab_access_url" {
  name        = "/gitlab/${var.environment}/url"
  description = "Gitlab UI url"
  type        = "String"
  value       = aws_route53_record.gitlab.fqdn

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}