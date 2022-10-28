variable "aks" {
    description = "List of AKS clusters and details"
    type = map
}

variable "creationSleep" {
    default = "60s"
    description = "Sleep time after creation of the cluster"
    type = string
}

variable "env" {
    description = "Required to define name of resources"
    type = string
}

variable "location" {
    description = "Region to host resources"
    type = string
}

variable "resourceGroup" {
    description = "Name of ResourceGroup to allocate AKS cluster"
    type = string
  
}

variable "subscriptionId" {
    description = "Define the subscription to allocate resources"
    type = string
}

variable "thanosNamespace" {
    description = "Namespace that Thanos is deployed"
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