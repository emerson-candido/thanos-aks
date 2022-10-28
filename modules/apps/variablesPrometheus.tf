variable "prometheusHelmChart" {
  default     = "kube-prometheus-stack"
  description = "Name of the helm chart to deploy"
  type        = string
}

variable "prometheusHelmChartName" {
    default     = "prometheus-stack"
    description = "Name of the helm deployment"
    type        = string
}

variable "prometheusHelmChartRepository" {
    default     = "https://prometheus-community.github.io/helm-charts"
    description = "URL of helm chart repository"
    type        = string
}

variable "prometheusHelmChartVersion" {
    default     = "41.5.1"
    description = "Helm chart version of Prometheus to deploy"
    type        = string
}

variable "prometheusNamespace" {
    default     = "monitoring"
    description = "Namespace to deploy Ingress Nginx"
    type        = string
}