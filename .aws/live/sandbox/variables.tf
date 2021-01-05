variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "service_name" {
  description = "Name for this service"
  default     = "tracy-su-aws"
}

variable  "AWS_ACCESS_KEY_ID" {
  type = "string"
}

variable  "AWS_SECRET_ACCESS_KEY" {
  type = "string"
}