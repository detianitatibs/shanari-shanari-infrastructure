variable "APP_NAME" {
  type        = string
  description = "The name of this application"
  sensitive   = true
}

variable "GCP_PROJECT_NAME" {
  type        = string
  description = "The name of GCP Project"
  sensitive   = true
}

variable "GCP_REAGION" {
  type        = string
  description = "The value of GCP Region"
  sensitive   = true
}

variable "POSTGRES_USER" {
  type        = string
  description = "The value of CloudSQL for Postgres's admin user"
  sensitive   = true
}

variable "POSTGRES_PASSWORD" {
  type        = string
  description = "The value of CloudSQL for Postgres's admin password"
  sensitive   = true
}