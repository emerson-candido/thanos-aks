resource "time_sleep" "wait_60_seconds" {
    create_duration = var.creationSleep

    depends_on = [
        azurerm_kubernetes_cluster.aks
    ]
}