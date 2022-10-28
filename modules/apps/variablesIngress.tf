variable "ingressHelmChart" {
  default     = "ingress-nginx"
  description = "Name of the helm chart to deploy"
  type        = string
}

variable "ingressHelmChartName" {
    default     = "ingress-nginx"
    description = "Name of the helm deployment"
    type        = string
}

variable "ingressHelmChartRepository" {
    default     = "https://kubernetes.github.io/ingress-nginx"
    description = "URL of helm chart repository"
    type        = string
}

variable "ingressHelmChartVersion" {
    default     = "4.3.0"
    description = "Helm chart version to deploy"
    type        = string
}

variable "ingressNamespace" {
    default     = "ingress-nginx"
    description = "Namespace to deploy Ingress Nginx"
    type        = string
}