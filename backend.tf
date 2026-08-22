# terraform {

#   backend "s3" {

#     bucket = "YOUR-TERRAFORM-STATE-BUCKET"

#     key = "eks-gitops-platform/terraform.tfstate"

#     region = "eu-west-1"

#     encrypt = true

#   }

# }