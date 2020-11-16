# App terraform module for GitLab CI on AWS

Deploys application servers and external access load balancer for GitLab CI deployment on AWS.
To simplify installation the Route53 zone and ACM certificate was created previously.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.5 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.14 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | The name of used environment | `string` | n/a | yes |
| gitlab\_acm\_certificate\_arn | Validate ACN certificate | `string` | n/a | yes |
| gitlab\_app\_ami | AMI id for GitLab EE version | `string` | `"ami-08264c998791b9428"` | no |
| gitlab\_app\_flavor | Flavor for gitlab app servers | `string` | `"t2.micro"` | no |
| gitlab\_iam\_profile\_name | The name of IAM profile for GitLab instances | `string` | n/a | yes |
| gitlab\_keypair | Ssh key pair for access to instances | `string` | n/a | yes |
| gitlab\_lb\_sg\_ids | Security group ids for gitlab app servers | `list(string)` | n/a | yes |
| gitlab\_private\_subnets | List of private subnets to create servers in | `list(string)` | n/a | yes |
| gitlab\_public\_subnets | List of private subnets to create LB in | `list(string)` | n/a | yes |
| gitlab\_vpc\_id | The ID of the GitLab installation VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| gitlab\_access\_url | Gitlab UI url |

