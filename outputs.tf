# Outputs for the GCS bucket
output "bucket_name" {
  description = "The name of the created GCS bucket."
  value       = google_storage_bucket.cost_optimized.name
}

output "bucket_url" {
  description = "The URL of the created GCS bucket."
  value       = google_storage_bucket.cost_optimized.url
}
