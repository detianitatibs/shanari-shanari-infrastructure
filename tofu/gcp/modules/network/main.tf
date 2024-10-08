# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.app_name}-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# Subnet
resource "google_compute_subnetwork" "subnet_private_1" {
  name          = "${var.app_name}-subnet-private-1"
  ip_cidr_range = "10.0.0.0/16"
  region        = "${var.gcp_region}"
  network       = google_compute_network.vpc.id
}

# プライベートネットワーク内にCloudSQLを準備するためPrivate Service Connectionを作成
# 参考: https://zenn.dev/ring_belle/articles/gcp-gke-cloudrun-private
resource "google_project_service" "service_networking" {
  service            = "servicenetworking.googleapis.com"
  disable_on_destroy = false
}

resource "google_compute_global_address" "private_ip_address" {
  name          = "shanari-vpc-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}