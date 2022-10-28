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
    default = "tfstate"
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

variable "terraform_backend_config_file_name" {
    description = "Name of backend file to be created"
    type        = string
    default     = "backend.tf"
}

variable "terraform_backend_config_file_path" {
    description = "Directory to host backend file"
    type        = string
    default     = "."
}

variable "terraform_backend_config_file_permission" {
    description = "Set permissions on backend file"
    type        = string
    default     = "0644"
}

variable "terraform_backend_config_key" {
    description = "Key name of remote state"
    type = string
    default = "terraform.tfstate"
}

variable "terraform_backend_config_profile" {
    description = "Define the profile of the backend"
    type        = string
    default     = ""
}

variable "terraform_backend_config_template_directory" {
    description = "Set the directory to host template of backend file"
    type        = string
    default     = "templates"
}

variable "terraform_backend_config_template_file" {
    description = "Name of template file for backend"
    type        = string
    default     = "terraform.tf.tpl"
}