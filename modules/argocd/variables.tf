variable "chart_name" {
  description = "The name of the helm chart and release"
  type        = string
  default     = "argo-cd"
}

variable "repository_url" {
  description = "Repository URL for ArgoCD Helm chart"
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

variable "chart_version" {
  description = "The version of the helm chart"
  type        = string
}

variable "namespace" {
  description = "The namespace where ArgoCD will be installed"
  type        = string
  default     = "argocd"
}

variable "create_namespace" {
  description = "Create the namespace if it does not exist"
  type        = bool
  default     = true
}

variable "set_values" {
  description = "Custom values to set in the Helm release"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}