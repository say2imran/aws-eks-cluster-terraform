variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "environment_name" {
  description = "The name of Environment Infrastructure stack, feel free to rename it. Used for cluster and VPC names."
  type        = string
  default     = "eks-dev"
}

variable "ingress_type" {
  type        = string
  description = "Type of ingress to uses (alb | nginx | ...). this parameter will be sent to argocd via gitops bridge"
  default     = "alb"
}

variable "hosted_zone_name" {
  type        = string
  description = "Route53 domain for the cluster."
  default     = ""
}

variable "eks_admin_role_name" {
  type        = string
  description = "Additional IAM role to be admin in the cluster"
  default     = ""
}

variable "aws_secret_manager_git_private_ssh_key_name" {
  type        = string
  description = "Secret Manager secret name for hosting Github SSH-Key to Access private repository"
  default     = "github-blueprint-ssh-key"
}

variable "argocd_secret_manager_name_suffix" {
  type        = string
  description = "Name of secret manager secret for ArgoCD Admin UI Password"
  default     = "argocd-admin-secret"
}

variable "gitops_addons_org" {
  type        = string
  description = "Git repository org/user contains for addons"
  default     = "git@github.com:aws-samples"
}
variable "gitops_addons_repo" {
  type        = string
  description = "Git repository contains for addons"
  default     = "eks-blueprints-add-ons"
}
variable "gitops_addons_basepath" {
  type        = string
  description = "Git repository base path for addons"
  default     = "argocd/"
}
variable "gitops_addons_path" {
  type        = string
  description = "Git repository path for addons"
  default     = "argocd/bootstrap/control-plane/addons"
}
variable "gitops_addons_revision" {
  type        = string
  description = "Git repository revision/branch/ref for addons"
  default     = "HEAD"
}

variable "gitops_workloads_org" {
  type        = string
  description = "Git repository org/user contains for workloads"
  default     = "git@github.com:aws-samples"
}

variable "gitops_workloads_repo" {
  type        = string
  description = "Git repository contains for workloads"
  default     = "eks-blueprints-workloads"
}

variable "gitops_workloads_path" {
  type        = string
  description = "Git repo path in workload_repo_url for the ArgoCD workload deployment"
  default     = "envs/dev"
}

variable "gitops_workloads_revision" {
  type        = string
  description = "Git repo revision in workload_repo_url for the ArgoCD workload deployment"
  default     = "main"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "eks-dev"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "eks-dev-vpc"
}

variable "service_account_name" {
  type        = string
  description = "Name of the service account"
  default     = "eks-dev-sa"
}

variable "aws_iam_role_arn" {
  type        = string
  description = "ARN of the IAM role"
  default     = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

variable "namespace" {
  type        = string
  description = "Name of the namespace"
  default     = "default"
}