#resource "kubernetes_secret" "thanosStorageSecret" {
#    for_each = var.aks
#
#    metadata {
#        name      = var.thanosSecretName
#        namespace = var.thanosNamespace
#    }
#
#    data = {
#        "type" = "AZURE"
#        "config" = <<EOT
#{
#"storage_account": "${var.thanosStorageAccount}"
#"storage_account_key": "${var.thanosStorageKey}"
#"container": "${var.thanosStorageContainer}"
#}
#EOT
#
#    }
#
#    depends_on = [
#        time_sleep.wait_60_seconds
#    ]
#}