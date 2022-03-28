#!/bin/bash
set -eo pipefail

# Initialize Terraform
terraform init

# Execute Terraform plan
if [ "${ACTION}" -eq "plan" ]; then
   terraform plan
fi

# Execute Terraform apply
if [ "${ACTION}" -eq "apply" ]; then
   terraform plan -out aws.tfplan
   terraform apply aws.tfplan
fi

# Execute Terraform apply
if [ "${ACTION}" -eq "destroy" ]; then
   terraform destroy -auto-approve
fi
