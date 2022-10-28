resource "kubernetes_manifest" "thanosStorage" {
    for_each ={
        for cluster, values in var.aks : cluster => values
        if values.prometheus == true
    }

    manifest = yamldecode(<<-EOF
        apiVersion: "argoproj.io/v1alpha1"
        kind: "Application"
        metadata:
            name: "${each.key}-${var.thanosStorageHelmChartName}"
            namespace: "${var.namespace}"
        spec:
            project: "default"
            source:
                repoURL: "${var.thanosStorageHelmChartRepository}"
                path: "${var.thanosStorageHelmChart}"
                targetRevision: "${var.thanosStorageHelmChartVersion}"
                helm:
                    parameters:
                    - name: "container"
                      value: "${var.thanosStorageContainer}"
                    - name: "name"
                      value: "${var.thanosSecretName}"
                    - name: "storage_account"
                      value: "${var.thanosStorageAccount}"
                    - name: "storage_account_key"
                      value: "${var.thanosStorageKey}"
            syncPolicy:
                syncOptions:
                - "CreateNamespace=true"
            destination:
                name: "${each.key}"
                namespace: "${var.prometheusNamespace}"
        EOF
    )
}