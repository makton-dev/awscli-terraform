#!/bin/bash
set -eo pipefail

# Initialize Terraform
terraform init

# Validate Terraform plan
terraform plan

# Execute Terraform apply
# if [ "${apply}" == "true" ]; then
#   terraform apply aws.tfplan
# fi
