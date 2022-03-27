#! /usr/bin/env bash
set -eo pipefail

# Set Terraform Variable via Environment
ENV="$Something"

# Enable console. this is done after ENVs as they are sensitive
set -x

# Initialize Terraform
terraform init

# Validate Terraform plan
terraform plan -out aws.tfplan

# Execute Terraform plan
if [ "${apply}" == "true" ]; then
  terraform apply aws.tfplan
fi