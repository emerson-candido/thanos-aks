resource "kubernetes_secret" "cluster" {
    for_each = var.aks

    metadata {
        labels = {
            "argocd.argoproj.io/secret-type" = "cluster"
        }

        name      = "cluster-${each.key}"
        namespace = var.namespace
    }

    data = {
        "name" = each.key
        "server" = var.aksHost[each.key]
        "config" = <<EOT
{
"tlsClientConfig": {
    "insecure": false,
    "certData": "${var.aksClientCertificate[each.key]}",
    "keyData": "${var.aksClientKey[each.key]}",
    "caData": "${var.aksClusterCaCertificate[each.key]}"
    }
}
EOT
    }

    depends_on = [
        helm_release.argocd
    ]
}