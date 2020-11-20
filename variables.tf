variable "environment" {
  type        = string
  description = "The name of used environment"
}

variable "gitlab_vpc_id" {
  description = "The ID of the GitLab installation VPC"
  type        = string
}

variable "gitlab_keypair" {
  description = "Ssh key pair for access to instances"
  type        = string
}

variable "gitlab_app_ami" {
  description = "AMI id for GitLab EE version"
  default     = "ami-08264c998791b9428"
  type        = string
}

variable "gitlab_private_subnets" {
  description = "List of private subnets to create servers in"
  type        = list(string)
}

variable "gitlab_public_subnets" {
  description = "List of private subnets to create LB in"
  type        = list(string)
}

variable "gitlab_app_flavor" {
  description = "Flavor for gitlab app servers"
  default     = "t2.micro"
  type        = string
}

variable "gitlab_lb_sg_ids" {
  description = "Security group ids for gitlab app servers"
  type        = list(string)
}

variable "gitlab_iam_profile_name" {
  description = "The name of IAM profile for GitLab instances"
  type        = string
}

variable "gitlab_acm_certificate_arn" {
  description = "Validate ACN certificate"
  type        = string
}

variable "gitlab_token" {
  description = "Gitlab shared secret for components"
  type        = string
}