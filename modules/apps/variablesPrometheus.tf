variable "prometheusHelmChart" {
  default     = "kube-prometheus-stack"
  description = "Name of the helm chart to deploy"
  type        = string
}

variable "prometheusHelmChartName" {
    default     = "kube-prometheus-stack"
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

variable "thanosObjectStorageConfigKey" {
    default = "thanos.yaml"
    description = "Name of the file that contains storage account settings for Thanos Sidecar"
    type = string
}

variable "thanosObjectStorageConfigName" {
    default = "thanos-objectstore"
    description = "Name of the secret that contains storage settings for Thanos Sidecar"
    type = string
}

variable "thanosServiceMonitorInterval" {
    default = "5s"
    description = "Time to sync data in Thanos sidecar"
    type = string
}
