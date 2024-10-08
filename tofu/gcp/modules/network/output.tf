output "vpc_id" {
  value = google_compute_network.vpc.id
}
output "vpc_self_link" {
  value = google_compute_network.vpc.self_link
}
output "subnet_private_1_self_link" {
  value = google_compute_subnetwork.subnet_private_1.self_link
}