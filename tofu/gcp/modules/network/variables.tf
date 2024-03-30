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