output "kubeconfig" {
    description = "Kubeconfig file of AKS cluster"
    value = {
        for k, v in azurerm_kubernetes_cluster.aks: k => v.kube_config_raw
    }
    sensitive = true
}

output "host" {
    description = "Url of AKS cluster to connect"
    value = {
        for k, v in azurerm_kubernetes_cluster.aks: k => v.kube_config[0].host
    }
    sensitive = true
}

output "clientCertificate" {
    description = "Client certificate of AKS cluster"
    value = {
        for k, v in azurerm_kubernetes_cluster.aks: k => v.kube_config[0].client_certificate
    }
    sensitive = true
}

output "clientKey" {
    description = "Certificate key of AKS cluster"
    value = {
        for k, v in azurerm_kubernetes_cluster.aks: k => v.kube_config[0].client_key
    }
    sensitive = true
}

output "clusterCaCertificate" {
    description = "CA certificate of AKS cluster"
    value = {
        for k, v in azurerm_kubernetes_cluster.aks: k => v.kube_config[0].cluster_ca_certificate
    }
    sensitive = true
}