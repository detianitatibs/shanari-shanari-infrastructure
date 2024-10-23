# CloudSQL for Postgres
resource "google_sql_database" "postgres" {
  name     = "${var.app_name}-cloudsql-postgres"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_database_instance" "postgres" {
  name                 = "${var.app_name}-cloudsql-postgres-instance"
  region               = "${var.gcp_region}"
  database_version     = "POSTGRES_16"
  deletion_protection  = "false"

  settings {
    tier              = "db-f1-micro"
    disk_size         = 10
    disk_autoresize   = true
    availability_type = "REGIONAL"
    activation_policy = "NEVER"
    ip_configuration {
      ipv4_enabled    = true
      private_network = "${var.vpc_id}"
    }
  }

  lifecycle {
    ignore_changes = [
      name,
      settings[0].disk_size
    ]
  }
}

resource "google_sql_user" "admin" {
  name     = "${var.admin_user}"
  instance = google_sql_database_instance.postgres.name
  password = "${var.admin_password}"
}
