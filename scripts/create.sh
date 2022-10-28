#!/bin/bash
rm backend.tf
touch kubeconfig_argocd
terraform init

# Create basic infrastructure
terraform apply \
    -var-file=values.tfvars \
    -target=module.resourceGroups \
    -target=module.remoteState \
    -target=module.thanosStorage \
    -target=module.aks \
    -auto-approve

# Migrate remote state to blob storage
terraform init -migrate-state -force-copy

# Deploy ArgoCD
terraform apply \
    -var-file=values.tfvars \
    -target=module.argocd \
    -auto-approve

# Deploy rest of resources
terraform apply \
    -var-file=values.tfvars \
    -auto-approve

# Remove no more required local tfstate files
rm terraform.tfstate*