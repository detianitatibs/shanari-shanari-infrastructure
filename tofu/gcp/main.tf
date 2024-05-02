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

# module "helm" {
#   source                     = "./modules/helm"

#   gke_endpoint               = module.gke.gke_endpoint
#   gke_client_certificate     = module.gke.gke_client_certificate
#   gke_client_key             = module.gke.gke_client_key
#   gke_cluster_ca_certificate = module.gke.gke_cluster_ca_certificate
# }