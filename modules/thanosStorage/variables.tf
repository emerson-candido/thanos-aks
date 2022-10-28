variable "accountTier" {
    description = "Tier type of storage account to host remote state data"
    type = string
    default = "Standard"
}

variable "accountType" {
    description = "Type of storage account to be created for remote state"
    type = string
    default = "LRS"
}

variable "containerName" {
    description = "Name of the container to be created"
    type = string
}

variable "containerAccessType" {
    description = "Type of access to the container"
    type = string
    default = "private"
}

variable "env" {
    description = "Name of the environment to associate resources"
    type = string
}

variable "name" {
    description = "Name of the Storage Account to host remote state data"
    type = string
}

variable "location" {
    description = "Region to host the remote state storage account"
    type = string
}

variable "resourceGroup" {
    description = "Name of Resource Group to host remote state storage account"
    type = string
}

variable "subscriptionId" {
    description = "Name of the subscription to host storage account to host remote state data"
    type = string
}