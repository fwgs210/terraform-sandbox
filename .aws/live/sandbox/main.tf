provider "aws" {
  region  = var.region
  # access_key = var.AWS_ACCESS_KEY_ID
  # secret_key = var.AWS_SECRET_ACCESS_KEY
  
  assume_role {
    role_arn = "arn:aws:iam::838374399476:role/admin"
  }  
}

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
  stage             = "sandbox"
}
