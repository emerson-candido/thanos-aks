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