#!/bin/bash

terraform state pull
rm backend.tf
terraform init -migrate-state -force-copy
terraform destroy -var-file=values.tfvars -auto-approve
rm -rf .terraform*
rm -rf terraform.tfstate*