variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "service_name" {
  description = "Name for this service"
  default     = "tracy-su-aws"
}

variable "stage" {
  description = "Stage for this service"
  default     = "sandbox"
}

variable  "AWS_ACCESS_KEY_ID" {
  type = "string"
}

variable  "AWS_SECRET_ACCESS_KEY" {
  type = "string"
}