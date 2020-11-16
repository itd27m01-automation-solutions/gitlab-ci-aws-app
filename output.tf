output "gitlab_access_url" {
  description = "Gitlab UI url"
  value       = aws_route53_record.gitlab.fqdn
}