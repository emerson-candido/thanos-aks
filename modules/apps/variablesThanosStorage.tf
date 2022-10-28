variable "thanosStorageHelmChartName" {
    default = "thanos-storage-secret"
    description = "Helm Chart name to deploy"
    type = string
}

variable "thanosStorageHelmChartRepository" {
    default = "https://github.com/emerson-candido/thanos-aks"
    description = "URL of repository to deploy"
    type = string
}

variable "thanosStorageHelmChart" {
    default = "helm-charts/thanosStorage"
    description = "Helm Chart path"
    type = string
}

variable "thanosStorageHelmChartVersion" {
    default = "HEAD"
    description = "Chart version to deploy"
    type = string
}

variable "thanosSecretName" {
    description = "Name of the secret to host ObjectStore secret"
    type = string
}

variable "thanosStorageAccount" {
    description = "Storage account to host Thanos data"
    type = string
}

variable "thanosStorageContainer" {
    description = "Storage container to host data"   
    type = string
}

variable "thanosStorageKey" {
    description = "Storage key to connect on blob storage"
    type = string
}