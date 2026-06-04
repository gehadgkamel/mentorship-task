output "metadata" {
  description = "Status of the deployed Helm release"
  value       = helm_release.argocd.metadata
}

output "name" {
  description = "The name of the Helm release"
  value       = helm_release.argocd.name
}