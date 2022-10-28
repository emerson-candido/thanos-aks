variable "argocdHelmChart" {
  default     = "argo-cd"
  description = "Name of the helm chart to deploy"
  type        = string
}

variable "argocdHelmChartName" {
    default     = "argocd"
    description = "Name of the helm deployment"
    type        = string
}

variable "argocdHelmChartRepository" {
    default     = "https://argoproj.github.io/argo-helm"
    description = "URL of helm chart repository"
    type        = string
}

variable "argocdHelmChartVersion" {
    default     = "5.6.3"
    description = "Helm chart version of Prometheus to deploy"
    type        = string
}

variable "argocdNamespace" {
    default     = "argocd"
    description = "Namespace to deploy Ingress Nginx"
    type        = string
}