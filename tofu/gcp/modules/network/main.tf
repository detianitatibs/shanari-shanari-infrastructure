# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.app_name}-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# Subnet
resource "google_compute_subnetwork" "subnet_private_1" {
  name          = "${var.app_name}-subnet-private-1"
  ip_cidr_range = "10.168.1.0/24"
  region        = "${var.gcp_region}"
  network       = google_compute_network.vpc.id
}