resource "kubernetes_manifest" "ingress" {
    for_each ={
        for cluster, values in var.aks : cluster => values
        if values.ingress == true
    }

    manifest = yamldecode(<<-EOF
        apiVersion: "argoproj.io/v1alpha1"
        kind: "Application"
        metadata:
            name: "${each.key}-${var.ingressHelmChartName}"
            namespace: "${var.namespace}"
        spec:
            project: "default"
            source:
                repoURL: "${var.ingressHelmChartRepository}"
                targetRevision: "${var.ingressHelmChartVersion}"
                chart: "${var.ingressHelmChart}"
                helm:
                    parameters:
                    - name: "controller.service.annotations.service.beta.kubernetes.io/azure-load-balancer-internal"
                      value: "true"
            syncPolicy:
                syncOptions:
                - "CreateNamespace=true"
            destination:
                name: "${each.key}"
                namespace: "${var.ingressNamespace}"
        EOF
    )
}