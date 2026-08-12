output "iam_role_arn" {
  description = "The ARN of the IAM Role for Atlantis"
  value       = aws_iam_role.atlantis.arn
}

output "helm_release_name" {
  description = "The name of the Atlantis Helm release."
  value       = helm_release.atlantis.name
}

output "service_account_role_arn" {
  description = "The ARN of the IAM role assigned to Atlantis via OIDC service account annotation."
  value       = aws_iam_role.atlantis.arn
}