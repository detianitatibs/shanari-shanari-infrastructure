# Storage for datalake
resource "google_storage_bucket" "datalake" {
  name     = "${var.app_name}-datalake"
  location = "ASIA-NORTHEAST1"
}