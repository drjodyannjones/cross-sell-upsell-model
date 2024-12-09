# Provider Configuration
provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

# GCS Buckets for Bronze, Silver, and Gold Layers
resource "google_storage_bucket" "bronze" {
  name          = "${var.project_id}-bronze-data"
  location      = var.region
  storage_class = var.storage_class
}

resource "google_storage_bucket" "silver" {
  name          = "${var.project_id}-silver-data"
  location      = var.region
  storage_class = var.storage_class
}

resource "google_storage_bucket" "gold" {
  name          = "${var.project_id}-gold-data"
  location      = var.region
  storage_class = var.storage_class
}

# BigQuery Datasets for Bronze, Silver, and Gold Layers
resource "google_bigquery_dataset" "bronze_data" {
  dataset_id = "bronze_data"
  project    = var.project_id
  location   = var.region
}

resource "google_bigquery_dataset" "silver_data" {
  dataset_id = "silver_data"
  project    = var.project_id
  location   = var.region
}

resource "google_bigquery_dataset" "gold_data" {
  dataset_id = "gold_data"
  project    = var.project_id
  location   = var.region
}

# Outputs
output "bronze_gcs_bucket" {
  value = google_storage_bucket.bronze.name
}

output "silver_gcs_bucket" {
  value = google_storage_bucket.silver.name
}

output "gold_gcs_bucket" {
  value = google_storage_bucket.gold.name
}

output "bronze_dataset" {
  value = google_bigquery_dataset.bronze_data.dataset_id
}

output "silver_dataset" {
  value = google_bigquery_dataset.silver_data.dataset_id
}

output "gold_dataset" {
  value = google_bigquery_dataset.gold_data.dataset_id
}
