output "vpc_self_lint" {
    value = google_compute_network.vpc.self_link
}
output "subnet_private_1_self_link" {
    value = google_compute_subnetwork.subnet_private_1.self_link
}