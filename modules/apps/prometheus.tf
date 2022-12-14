resource "kubernetes_manifest" "prometheus" {
    for_each ={
        for cluster, values in var.aks : cluster => values
        if values.prometheus == true
    }

    manifest = yamldecode(<<-EOF
        apiVersion: "argoproj.io/v1alpha1"
        kind: "Application"
        metadata:
            name: "${each.key}-${var.prometheusHelmChartName}"
            namespace: "${var.namespace}"
        spec:
            project: "default"
            source:
                repoURL: "${var.prometheusHelmChartRepository}"
                targetRevision: "${var.prometheusHelmChartVersion}"
                chart: "${var.prometheusHelmChart}"
                helm:
                    parameters:
                    - name: "grafana.enabled"
                      value: "${each.value.grafana}"
                    - name: "prometheus.prometheusSpec.thanos.objectStorageConfig.key"
                      value: "${var.thanosObjectStorageConfigKey}"
                    - name: "prometheus.prometheusSpec.thanos.objectStorageConfig.name"
                      value: "${var.thanosObjectStorageConfigName}"
                    - name: "prometheus.thanosService.enabled"
                      value: "${each.value.thanosSidecar}"
                    - name: "prometheus.thanosServiceMonitor.enabled"
                      value: "${each.value.thanosSidecar}"
                    - name: "prometheus.thanosServiceMonitor.interval"
                      value: "${var.thanosServiceMonitorInterval}"
            syncPolicy:
                syncOptions:
                - "CreateNamespace=true"
            destination:
                name: "${each.key}"
                namespace: "${var.prometheusNamespace}"
        EOF
    )
}