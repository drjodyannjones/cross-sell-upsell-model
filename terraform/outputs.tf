output "bronze_gcs_bucket" {
  value = google_storage_bucket.bronze.name
  description = "Name of the Bronze GCS bucket"
}

output "silver_gcs_bucket" {
  value = google_storage_bucket.silver.name
  description = "Name of the Silver GCS bucket"
}

output "gold_gcs_bucket" {
  value = google_storage_bucket.gold.name
  description = "Name of the Gold GCS bucket"
}

output "bronze_dataset" {
  value = google_bigquery_dataset.bronze_data.dataset_id
  description = "Name of the Bronze BigQuery dataset"
}

output "silver_dataset" {
  value = google_bigquery_dataset.silver_data.dataset_id
  description = "Name of the Silver BigQuery dataset"
}

output "gold_dataset" {
  value = google_bigquery_dataset.gold_data.dataset_id
  description = "Name of the Gold BigQuery dataset"
}
