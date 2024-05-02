output "gke_endpoint" {
  value = google_container_cluster.gke.endpoint
}
output "gke_client_certificate" {
  value = google_container_cluster.gke.master_auth.0.client_certificate
}
output "gke_client_key" {
  value = google_container_cluster.gke.master_auth.0.client_key
}
output "gke_cluster_ca_certificate" {
  value = google_container_cluster.gke.master_auth.0.cluster_ca_certificate
}