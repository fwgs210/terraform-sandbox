provider "aws" {
  region  = var.region
  
  assume_role {
    role_arn = "arn:aws:iam::838374399476:role/admin"
  }  
}
# s3 backend
# terraform {
#   backend "s3" {
#     bucket = "tracy-su-sandbox-terraform-state"
#     key    = "terraform.tfstate"
#     region = "us-east-1"
#     role_arn = "arn:aws:iam::838374399476:role/admin"
#   }
# }

# remote backend using terraform cloud
terraform {
  backend "remote" {
    organization = "tracy-su-sandbox"

    workspaces {
      name = "hello-lambda"
    }
  }
}

module "tracy-su-aws-service" {
  source = "../../modules/service"

  service_name      = var.service_name
  shared_account_id = "838374399476"
  stage             = var.stage
}
