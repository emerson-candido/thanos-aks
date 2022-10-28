# Copyright 2022 Nordcloud Oy or its affiliates. All Rights Reserved.
terraform {
    backend "azurerm" {
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
        resource_group_name  = "rg_thanos"
        storage_account_name = "remotestatethanos"
    }
}