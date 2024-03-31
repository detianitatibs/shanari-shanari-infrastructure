# GKE cluster Autopilot mode
resource "google_container_cluster" "gke" {
  name                = "${var.app_name}-gke-cluster"
  enable_autopilot    = true
  location            = var.gcp_region
  deletion_protection = false

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.1.0.0/16"
    services_ipv4_cidr_block = "10.2.0.0/16"
  }
  network    = var.vpc_self_link
  subnetwork = var.subnet_private_1_self_link

}