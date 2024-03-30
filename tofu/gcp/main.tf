terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.20.0"
    }
  }

  backend "gcs" {}
}

provider "google" {
  project = var.GCP_PROJECT_NAME
  region  = var.GCP_REAGION
}

module "network" {
  source     = "./modules/network"

  app_name   = var.APP_NAME
  gcp_region = var.GCP_REAGION
}