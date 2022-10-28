variable "aks" {
    description = "List of AKS clusters"
    type        = map
}

variable "env" {
    default = "Environment to deploy the application"
    type    = string
}

variable "namespace" {
    default     = "argocd"
    description = "Namespace that ArgoCD is deployed"
    type        = string
}