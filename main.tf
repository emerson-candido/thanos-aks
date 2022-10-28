module "resourceGroups" {
    source = "./modules/resourceGroups"

    name            = "rg_${var.env}"
    env             = var.env
    region          = var.region
    subscriptionId  = var.subscriptionId
}

module "remoteState" {
    source = "./modules/remoteState"

    name             = "remotestate${var.env}"
    env              = var.env
    location         = var.region
    resourceGroup    = "rg_${var.env}"
    subscriptionId   = var.subscriptionId

    depends_on = [
        module.resourceGroups
    ]
}

module "thanosStorage" {
    source = "./modules/thanosStorage"

    name             = "thanosstorage${var.env}"
    env              = var.env
    location         = var.region
    resourceGroup    = "rg_${var.env}"
    subscriptionId   = var.subscriptionId
    containerName    = var.thanosContainerName

    depends_on = [
        module.remoteState
    ]
}

module "aks" {
    source = "./modules/aks"

    aks                    = var.aks
    env                    = var.env
    location               = var.region
    resourceGroup          = "rg_${var.env}"
    subscriptionId         = var.subscriptionId
    thanosNamespace        = var.thanosNamespace
    thanosSecretName       = var.thanosSecretName
    thanosStorageAccount   = "thanosstorage${var.env}"
    thanosStorageContainer = var.thanosContainerName
    thanosStorageKey       = module.thanosStorage.objectStoreKey 
    
    depends_on = [
        module.thanosStorage
    ]
}

module "argocd" {
    for_each ={
        for cluster, values in var.aks : cluster => values
        if values.argocd == true
    }

    source = "./modules/argocd"

    aks                     = var.aks
    aksHost                 = module.aks.host
    aksClientCertificate    = module.aks.clientCertificate
    aksClientKey            = module.aks.clientKey
    aksClusterCaCertificate = module.aks.clusterCaCertificate
    env                     = var.env
    kubeconfigFilename      = var.kubeconfigFilename
    kubeconfigRaw           = module.aks.kubeconfig

    depends_on = [
        module.aks
    ]
}

module "apps" {
    for_each ={
        for cluster, values in var.aks : cluster => values
        if values.argocd == true
    }

    source = "./modules/apps"

    aks = var.aks
    env = var.env

    depends_on = [
        module.argocd
    ]
}