resource "local_file" "kubeconfig" {
    for_each ={
        for cluster, values in var.aks : cluster => values
        if values.argocd == true
    }
    
        content  = var.kubeconfigRaw[each.key]
        filename = var.kubeconfigFilename
}

resource "helm_release" "argocd" {
    chart            = var.helmChart
    create_namespace = true
    name             = var.helmChartName
    namespace        = var.namespace
    repository       = var.helmChartRepository

    set {
        name  = "server.config.exec\\.enabled"
        value = "true"
        type  = "string"
    }

    #set {
    #    name = "server.ingress.enabled"
    #    value = true
    #}

    #set {
    #    name = "server.ingress.ingressClassName"
    #    value = "nginx"
    #}

    depends_on = [
        local_file.kubeconfig
    ]
}