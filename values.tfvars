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

env                 = "thanos"
region              = "germanywestcentral"
subscriptionId      = "e8c963df-4fec-46aa-b523-08eeaf964bd6"