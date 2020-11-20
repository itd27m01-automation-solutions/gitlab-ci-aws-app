output "gitlab_access_url" {
  description = "Gitlab UI url"
  value       = aws_route53_record.gitlab.fqdn
}

output "gitlab_token" {
  description = "Gitlab shared secret for components"
  value       = aws_ssm_parameter.gitlab_token.value
  sensitive   = true
}