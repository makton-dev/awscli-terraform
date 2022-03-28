#!/bin/bash
set -eo pipefail

# Initialize Terraform
echo "Initializing Terraform"
terraform init

# Execute Terraform plan
echo "Checking Terraform Plan"
if [ "${ACTION}" == "plan" ]
then
   terraform plan

# Execute Terraform apply
elif [ "${ACTION}" == "apply" ]
then
   echo "Creating Terraform Plan"
   terraform plan -out aws.tfplan
   echo "Applying Terraform Plan"
   terraform apply aws.tfplan

# Execute Terraform apply
elif [ "${ACTION}" == "destroy" ]
then
   echo "Destroying infrastructure based on Terraform config. cannot undo!!!!"
   terraform destroy -auto-approve

# Looks like no valid action was provided
else
  echo "Please provide a proper action (plan, apply, destroy)"
fi
