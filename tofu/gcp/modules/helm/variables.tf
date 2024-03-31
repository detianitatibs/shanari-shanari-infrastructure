variable "gke_endpoint" {
  type        = string
  description = "The endpoint of Cluster"
  sensitive   = true
}
variable "gke_client_certificate" {
  type        = string
  description = "The client certificate of Cluster"
  sensitive   = true
}
variable "gke_client_key" {
  type        = string
  description = "The client key of Cluster"
  sensitive   = true
}
variable "gke_cluster_ca_certificate" {
  type        = string
  description = "The ca certificate of Cluster"
  sensitive   = true
}