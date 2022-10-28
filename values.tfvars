aks = {
    "thanos" = {
        argocd         = true
        grafana        = true
        ingress        = true
        nodePoolCount  = "1",
        nodePoolName   = "default",
        nodePoolVmSize = "Standard_D2_v2",
        prometheus     = true
    }, 
    "prometheus1" = {
        argocd         = false
        grafana        = false
        ingress        = true
        nodePoolCount  = "1",
        nodePoolName   = "default",
        nodePoolVmSize = "Standard_D2_v2",
        prometheus     = true
    }
}

repos = {
    "thanos-aks" = {
        type = "git"
        url = "https://github.com/emerson-candido/thanos-aks"
    }
}

env                 = "thanos"
region              = "germanywestcentral"
subscriptionId      = "e8c963df-4fec-46aa-b523-08eeaf964bd6"