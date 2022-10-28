variable "aks" {
    description = "List of AKS clusters"
    type        = map
}

variable "aksHost" {
    description = "Url of AKS cluster"
    type        = map
}

variable "aksClientCertificate" {
    description = "Client certificate of AKS cluster"
    type        = map
}

variable "aksClientKey" {
    description = "Certificate key of AKS cluster"
    type        = map
}

variable "aksClusterCaCertificate" {
    description = "CA certificate key of AKS cluster"
    type        = map
}

variable "helmChart" {
  default     = "argo-cd"
  description = "Name of the helm chart to deploy"
  type        = string
}

variable "helmChartName" {
    default     = "argocd"
    description = "Name of the helm deployment"
    type        = string
}

variable "helmChartRepository" {
    default     = "https://argoproj.github.io/argo-helm"
    description = "URL of helm chart repository"
    type        = string
}

variable "env" {
    default = "Environment to deploy the application"
    type    = string
}

variable "kubeconfigFilename" {
    description = "Kubeconfig filename of ArgoCD to provider"
    type        = string
}

variable "kubeconfigRaw" {
    description = "Value of kubeconfig raw file"
    type        = map
}

variable "namespace" {
    default     = "argocd"
    description = "Namespace to deploy ArgoCD"
    type        = string
}

variable "repos" {
    description = "List of repos to add in ArgoCD"
    type = map
}