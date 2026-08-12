variable "oidc_provider_arn" {
  description = "The ARN of the EKS OIDC Provider"
  type        = string
}

variable "oidc_provider_url" {
  description = "The URL of the EKS OIDC Provider"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for Atlantis"
  type        = string
  default     = "atlantis"
}

variable "service_account_name" {
  description = "Kubernetes Service Account name for Atlantis"
  type        = string
  default     = "atlantis"
}

variable "github_user" {
  description = "GitHub username"
  type        = string
}

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true # مهم جداً عشان تيرافورم ميطبعش الباسورد في التيرمينال
}

variable "github_webhook_secret" {
  description = "A random secret string for Webhook validation"
  type        = string
  sensitive   = true
}