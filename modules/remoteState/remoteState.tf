resource "azurerm_storage_account" "remoteState" {
    account_tier = var.accountTier
    account_replication_type = var.accountType
    location = var.location
    name = var.name
    resource_group_name = var.resourceGroup
 
    tags = {
        environment = var.env
    } 
}

resource "azurerm_storage_container" "remoteStateContainer" {
    container_access_type = var.containerAccessType
    name                  = var.containerName
    storage_account_name  = var.name

    depends_on = [
        azurerm_storage_account.remoteState
    ]
}