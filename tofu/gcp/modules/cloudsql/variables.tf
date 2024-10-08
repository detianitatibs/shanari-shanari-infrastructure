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

variable "vpc_id" {
  type        = string
  description = "The id of vpc"
  sensitive   = true
}

variable "admin_user" {
  type        = string
  description = "The value of CloudSQL for Postgres's admin user"
  sensitive   = true
}

variable "admin_password" {
  type        = string
  description = "The value of CloudSQL for Postgres's admin password"
  sensitive   = true
}