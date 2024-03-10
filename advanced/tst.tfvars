#
# Terraform look up to resolve variables on:
# 1. Environment variables
# 2. terraform.tfvars
# 3. terraform.tfvars.json
# 4. Any .auto.tfvars
# 5. Any CLI variable -var="" or -var-file options
VPC_NAME = "tst-vpc"
