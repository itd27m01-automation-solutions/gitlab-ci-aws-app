output "gitlab_keypair" {
  description = "SSH keypair for GitLab Instances"
  value       = aws_key_pair.gitlab_keypair.key_name
}

output "gitlab_access_url" {
  description = "Gitlab UI url"
  value       = aws_route53_record.gitlab.fqdn
}