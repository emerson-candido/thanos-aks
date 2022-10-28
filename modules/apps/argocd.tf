resource "kubernetes_manifest" "argocd" {
    for_each ={
        for cluster, values in var.aks : cluster => values
        if values.argocd == true
    }

    manifest = yamldecode(<<-EOF
        apiVersion: "argoproj.io/v1alpha1"
        kind: "Application"
        metadata:
            name: "${each.key}-${var.argocdHelmChartName}"
            namespace: "${var.namespace}"
        spec:
            project: "default"
            source:
                repoURL: "${var.argocdHelmChartRepository}"
                targetRevision: "${var.argocdHelmChartVersion}"
                chart: "${var.argocdHelmChart}"
                #helm:
                #    parameters:
                #    - name: "server.config.exec.enabled"
                #      value: "true"
            syncPolicy:
                syncOptions:
                - "CreateNamespace=true"
            destination:
                name: "${each.key}"
                namespace: "${var.argocdNamespace}"
        EOF
    )
}