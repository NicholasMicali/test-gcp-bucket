# Input variables for the GCS bucket
variable "project_id" {
  description = "The GCP project ID where the bucket will be created."
  type        = string
}

variable "bucket_name" {
  description = "The name of the GCS bucket. Must be globally unique."
  type        = string
}

variable "location" {
  description = "The location for the bucket. E.g., US, EU, asia-east1."
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "The storage class for the bucket. Use NEARLINE or COLDLINE for cost optimization."
  type        = string
  default     = "NEARLINE"
}

variable "log_bucket_name" {
  description = "The name of the bucket where access logs should be stored. Must be a different bucket."
  type        = string
}
