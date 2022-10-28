# POC Thanos

# Create the clusters

```
$ touch kubeconfig_argocd
$ terraform init
$ terraform plan -var-file=values.tfvars
$ terraform apply -var-file=values.tfvars -auto-approve
$ terraform init -migrate-state -force-copy
$ rm terraform.tfstate*
```

# Destroy the clusters

```
$ terraform state pull
$ rm backend.tf
$ terraform init -migrate-state -force-copy
$ terraform destroy -var-file=values.tfvars
$ rm -rf .terraform*
$ rm -rf terraform.tfstate*
```