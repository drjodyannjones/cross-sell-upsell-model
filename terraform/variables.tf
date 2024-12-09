# GCP Project Details
variable "project_id" {
  description = "The GCP project ID"
}

variable "region" {
  description = "The GCP region where resources will be created"
  default     = "us-central1"
}

variable "credentials_file" {
  description = "Path to the service account JSON key"
}

# Storage Configuration
variable "storage_class" {
  description = "The storage class for GCS buckets"
  default     = "STANDARD"
}
