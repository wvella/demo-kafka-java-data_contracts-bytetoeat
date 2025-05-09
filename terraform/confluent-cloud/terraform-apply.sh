#!/bin/bash
# Variables
TERRAFORM_DIR="." # Update this to the directory containing your Terraform configuration

# Step 1: Initialize Terraform
echo "Initializing Terraform..."
terraform -chdir="$TERRAFORM_DIR" init
if [ $? -ne 0 ]; then
  echo "Error: Terraform initialization failed."
  exit 1
fi

# Step 2: Run terraform apply
echo "Running terraform apply..."
terraform -chdir="$TERRAFORM_DIR" apply -auto-approve
if [ $? -ne 0 ]; then
  echo "Error: Terraform apply failed."
  exit 1
fi

echo "Terraform apply completed successfully."

# Step 3: Create a recipe
echo "Running recipe creation..."
cd ../../byte-to-eat-v1/
RECIPE_SCRIPT="run-producer-recipe.sh"

if [ -f "$RECIPE_SCRIPT" ]; then
  echo "Running run-producer-recipe.sh to create the first recipe..."
  bash "$RECIPE_SCRIPT"
  if [ $? -ne 0 ]; then
    echo "Error: run-producer-recipe.sh failed. Aborting Terraform apply."
    exit 1
  fi
else
  echo "Error: run-producer-recipe.sh not found at $RECIPE_SCRIPT. Aborting."
  exit 1
fi
