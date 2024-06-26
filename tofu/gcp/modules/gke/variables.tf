variable "app_name" {
  type        = string
  description = "The name of this application"
  sensitive   = true
}

variable "gcp_region" {
  type        = string
  description = "The value of GCP Region"
  sensitive   = true
}

variable "vpc_self_link" {
  type        = string
  description = "The self_link of vpc"
  sensitive   = true
}

variable "subnet_private_1_self_link" {
  type        = string
  description = "The self_link of private subnet1"
  sensitive   = true
}