locals {
    name = "backend-remote-storage"
    terraform_backend_config_file = format(
        "%s/%s",
        var.terraform_backend_config_file_path,
        var.terraform_backend_config_file_name
    )
    terraform_backend_config_template_file = "${path.module}/${var.terraform_backend_config_template_directory}/${var.terraform_backend_config_template_file}"
}

resource "local_file" "terraform_backend_config" {
    content = templatefile(local.terraform_backend_config_template_file, {
        container_name       = var.containerName
        key                  = var.terraform_backend_config_key
        resource_group_name  = var.resourceGroup
        storage_account_name = var.name
    })
  filename        = local.terraform_backend_config_file
  file_permission = var.terraform_backend_config_file_permission
}