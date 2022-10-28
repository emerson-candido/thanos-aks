resource "kubernetes_secret" "argocdRepo" {
    for_each = var.repos

    metadata {
        labels = {
            "argocd.argoproj.io/secret-type" = "repository"
        }

        name = "repo-${each.key}"
        namespace = var.namespace
    }

    data ={
        "type" = each.value.type
        "url" = each.value.url
        "name" = each.key
    } 

    depends_on = [
        helm_release.argocd
    ]
}