# Main Terraform configuration for a cost-optimized GCS bucket
# Provider block for Google Cloud
provider "google" {
  project = var.project_id
  region  = var.location
}

# Cost-optimized GCS bucket
resource "google_storage_bucket" "cost_optimized" {
  name                        = var.bucket_name
  location                    = var.location
  storage_class               = var.storage_class
  force_destroy               = true
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  # Enable versioning for security best practices
  versioning {
    enabled = true
  }

  # Enable access logging to a separate log bucket
  logging {
    log_bucket        = var.log_bucket_name
    log_object_prefix = "log"
  }

  # Lifecycle rule: transition objects to COLDLINE after 30 days
  lifecycle_rule {
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
    condition {
      age = 30
    }
  }

  # Lifecycle rule: delete objects after 365 days
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }
}
