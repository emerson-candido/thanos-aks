variable "env" {
    description = "Required to define name of resources"
    type = string
}

variable "name" {
    description = "Name of Resource Group to be created"
    type = string
}
variable "region" {
    description = "Region to host resources"
    type = string
}

variable "subscriptionId" {
    description = "Define the subscription to allocate resources"
    type = string
}