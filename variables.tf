variable "aks" {
    description = "List of AKS clusters and details"
    type = map    
}

variable "env" {
    description = "Name of the environment to associate the resoures"
    type = string
}

variable "kubeconfigFilename" {
    default     = "kubeconfig_argocd"
    description = "Kubeconfig filename of ArgoCD to provider"
    type        = string
}

variable "region" {
    description = "Region to host resources"
    type = string
}

variable "repos" {
    description = "List of repositories to add in ArgoCD"
    type = map
}

variable "subscriptionId" {
    description = "ID of the subscription to create the resources"
    type = string
}

variable "thanosContainerName" {
    default = "thanos"
    description = "Name of container to host Thanos storage"
    type = string
}

variable "thanosNamespace" {
    default = "monitoring"
    description = "Namespace that Thanos is deployed"
    type = string
}

variable "thanosSecretName" {
    default = "thanos-objectstore"
    description = "Name of the secret to host ObjectStore secret"
    type = string
}
