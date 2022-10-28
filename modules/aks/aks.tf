resource "azurerm_kubernetes_cluster" "aks" {
    for_each = var.aks

    default_node_pool {
        name       = each.value.nodePoolName
        node_count = each.value.nodePoolCount
        vm_size    = each.value.nodePoolVmSize
    }

    identity {
        type = "SystemAssigned"
    }

    dns_prefix          = "${var.env}-${each.key}"
    location            = var.location
    name                = "${var.env}-${each.key}"
    resource_group_name = var.resourceGroup

    tags = {
        environment = var.env
    }
}

resource "local_file" "kubeconfig" {
    for_each = var.aks
    filename = "kubeconfig_${var.env}-${each.key}"
    content = azurerm_kubernetes_cluster.aks[each.key].kube_config_raw
    depends_on = [
        azurerm_kubernetes_cluster.aks
    ]
}