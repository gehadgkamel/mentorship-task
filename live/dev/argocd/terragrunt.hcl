include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
    source = "../../../modules/argocd"
}
 
dependency "eks" {
  config_path = "../eks"
}

generate "helm_provider" {
  path      = "helm_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
data "aws_eks_cluster" "cluster" {
  name = "${dependency.eks.outputs.cluster_name}"
}

data "aws_eks_cluster_auth" "cluster" {
  name = "${dependency.eks.outputs.cluster_name}"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}
EOF
}

inputs = {
  chart_name       = "argo-cd"                                
  repository_url   = "https://argoproj.github.io/argo-helm"
  chart_version    = "7.1.1" 
  namespace        = "argocd"
  create_namespace = true

  set_values = [                                          
    {
      name  = "server.service.type"
      value = "NodePort"
    }
  ]
}