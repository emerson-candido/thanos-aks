# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscriptionId
}

provider "helm" {
    kubernetes {
        config_path = var.kubeconfigFilename
    }
}

provider "kubernetes" {
    config_path = var.kubeconfigFilename
}