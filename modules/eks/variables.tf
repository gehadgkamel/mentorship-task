variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "eks_version" {
  description = "Kubernetes version"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}