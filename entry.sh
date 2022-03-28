#!/bin/bash
set -eo pipefail

echo "${AWS_DEFAULT_REGION} - ${AWS_ACCESS_KEY_ID} - ${AWS_SECRET_ACCESS_KEY}"
# Initialize Terraform
terraform init

# Validate Terraform plan
terraform plan

# Execute Terraform apply
# if [ "${apply}" == "true" ]; then
#   terraform apply aws.tfplan
# fi
