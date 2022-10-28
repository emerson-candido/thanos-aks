output "kubeconfig" {
    description = "Kubeconfig file"
    value = module.aks.kubeconfig
    sensitive = true
}

output "aksHost" {
    description = "Url of AKS cluster"
    value = module.aks.host
    sensitive = true
}

output "aksClientCertificate" {
    description = "Client certificate of AKS cluster"
    value = module.aks.clientCertificate
    sensitive = true
}

output "aksClientKey" {
    description = "Certificate key of AKS cluster"
    value = module.aks.clientKey
    sensitive = true
}

output "aksClusterCaCertificate" {
    description = "CA certificate of AKS cluster"
    value = module.aks.clusterCaCertificate
    sensitive = true
}

output "objectStoreKey" {
    description = "Credentials required to Thanos connect to blob Storage account"
    value = module.thanosStorage.objectStoreKey
    sensitive = true
}