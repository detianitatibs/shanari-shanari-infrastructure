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

module "gke" {
  source                     = "./modules/gke"

  app_name                   = var.APP_NAME
  gcp_region                 = var.GCP_REAGION
  vpc_self_link              = module.network.vpc_self_link
  subnet_private_1_self_link = module.network.subnet_private_1_self_link
}

# module "cloudsql" {
#   source                     = "./modules/cloudsql"

#   app_name                   = var.APP_NAME
#   gcp_region                 = var.GCP_REAGION
#   admin_user                 = var.POSTGRES_USER
#   admin_password             = var.POSTGRES_PASSWORD
#   vpc_id                     = module.network.vpc_id
# }

module "storage" {
  source                     = "./modules/storage"

  app_name                   = var.APP_NAME
}