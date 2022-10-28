# Copyright 2022 Nordcloud Oy or its affiliates. All Rights Reserved.
terraform {
    backend "azurerm" {
        container_name       = "${container_name}"
        key                  = "${key}"
        resource_group_name  = "${resource_group_name}"
        storage_account_name = "${storage_account_name}"
    }
}