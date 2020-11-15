resource "aws_key_pair" "gitlab_keypair" {
  public_key = var.gitlab_public_ssh_key
}

resource "aws_instance" "gitlab_app" {
  for_each = toset(var.gitlab_private_subnets)

  ami           = var.gitlab_app_ami
  instance_type = var.gitlab_app_flavor
  key_name      = aws_key_pair.gitlab_keypair.key_name

  subnet_id              = each.key
  vpc_security_group_ids = var.gitlab_lb_sg_ids

  iam_instance_profile = var.gitlab_iam_profile_name

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Application = "gitlab"
    Role        = "app"
    Name        = "gitlab-app-${var.environment}-${index(var.gitlab_private_subnets, each.key)}"
  }
}
