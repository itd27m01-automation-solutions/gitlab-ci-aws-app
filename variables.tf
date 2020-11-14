variable "environment" {
  type        = string
  description = "The name of used environment"
}

variable "gitlab_vpc_id" {
  description = "The ID of the GitLab installation VPC"
  type        = string
}

variable "gitlab_public_ssh_key" {
  description = "Public part of ssh key pair for access to instances"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAqk+k1HXWuUUJw2MFipf35QRUpyOCBCIp/d2/F1drQbgrNwn9ZMgd3tjLLTDRPzD9+kNOkzbxpgXyfG0ukyrG9ovYj3e+Oc/1C36swFn9Zr5fxCC41yznr5axo0O/r0vZ9vH5BfIPGc5XNgXygnHiY7nFdWvoZcRQridjkRZqMuU= igortiunov@gmail.com"
  type        = string
}

variable "gitlab_app_ami" {
  description = "AMI id for GitLab EE version"
  default     = "ami-02c2be8bfcc172b1c"
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