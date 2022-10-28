resource "azurerm_resource_group" "rg" {
    location = var.region
    name     = var.name

    tags =  {
        environment = var.env
    } 
}