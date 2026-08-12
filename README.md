# 🚀 End-to-End Infrastructure Automation & GitOps on AWS


## 📌 Project Overview
This project demonstrates a modular Infrastructure as Code (IaC) and GitOps workflow on AWS. It provisions an EKS-based platform with secure networking, GitOps delivery, and Terraform automation for pull requests and infrastructure changes.

## 🏗️ Architecture & Tech Stack
- **Cloud Provider:** AWS (VPC, EKS, IAM, ALB, EBS)
- **Infrastructure as Code:** Terraform and Terragrunt
- **Container Orchestration:** Kubernetes on EKS
- **Package Management:** Helm
- **GitOps / Continuous Delivery:** ArgoCD
- **Terraform PR Automation:** Atlantis
- **Ingress & Networking:** NGINX Ingress Controller


## ✨ Key Features
- **DRY Infrastructure:** Terragrunt keeps the Terraform code reusable and easier to manage across environments.
- **Secure Access Model:** IRSA and OIDC are used to grant least-privilege AWS access to workloads such as Atlantis.
- **GitOps Workflow:** ArgoCD continuously syncs the cluster with the desired state defined in Git.
- **Automated Terraform Review:** Atlantis enables plan and apply actions from GitHub pull request comments.
- **Flexible Networking:** The setup includes a custom VPC with public/private subnets and NAT gateways for secure service exposure.

## 📂 Repository Structure
```text
.
├── live/
│   ├── root.hcl              # Shared Terragrunt root configuration
│   └── dev/                  # Development environment configuration
│       ├── argocd/           # ArgoCD Terragrunt config
│       ├── atlantis/         # Atlantis + ingress Terragrunt config
│       ├── eks/              # EKS Terragrunt config
│       └── network/          # Network/VPC Terragrunt config
├── modules/
│   ├── argocd/               # ArgoCD Terraform module
│   ├── atlantis/             # Atlantis, IAM, and ingress module
│   ├── eks/                  # EKS and OIDC module
│   └── network/              # VPC and networking module
```

## 🚀 Deployment Instructions

### Prerequisites
- AWS CLI configured with the appropriate permissions
- Terraform 1.0+ and Terragrunt installed
- GitHub token and webhook secret for Atlantis automation

### Steps to Deploy
1. **Clone the repository**

```bash
git clone <your-repository-url>
cd <your-repository>/live/dev
```

2. **Export required environment variables**

Create a local `.env` file from the example if you want:

```bash
cp .env.example .env
```

Then export secrets from that file or set them directly in your shell:

```bash
export GITHUB_TOKEN="your_github_token"
export GITHUB_WEBHOOK_SECRET="your_webhook_secret"
```

> Important: Do not store `GITHUB_TOKEN`, `GITHUB_WEBHOOK_SECRET`, or any other secrets in Git or Terraform files. Use `.env` locally and keep it out of version control.

3. **Preview the changes**

```bash
terragrunt run-all plan
```

4. **Apply the infrastructure**

```bash
terragrunt run-all apply
```

5. **Configure GitHub webhooks**
- Retrieve the public URL of the NGINX Ingress Controller load balancer.
- Add that URL to your GitHub repository webhooks using the `/events` path.

## 🧹 Cleanup
To avoid unnecessary AWS charges, destroy the infrastructure when it is no longer needed:

```bash
cd live/dev
terragrunt run-all destroy
```

## 💡 Notes
- Review the environment values in the Terragrunt files before deployment.
- Atlantis is configured with OIDC/IRSA and creates its IAM role automatically, so secrets are only passed through environment variables.
- Keep secrets and tokens out of version control.
- Use separate environments and state backends for production and non-production workloads.
