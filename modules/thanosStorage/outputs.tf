output "objectStoreKey" {
    description = "Credentials required to Thanos connect to blob Storage account"
    value = azurerm_storage_account.objectStore.primary_access_key
    sensitive = true
}