# Cost-Optimized Google Cloud Storage Bucket (Terraform)

This configuration creates a Google Cloud Storage bucket with cost-optimized settings using Terraform.

## Features
- Storage class: NEARLINE (default, configurable)
- Uniform bucket-level access enabled
- Public access prevention enforced
- `force_destroy` enabled for easy cleanup
- Lifecycle rules:
  - Transition objects to COLDLINE after 30 days
  - Delete objects after 365 days

## Usage

```
variable "bucket_name" {
  default = "my-unique-bucket-name"
}

module "gcs_bucket" {
  source      = "./"
  bucket_name = var.bucket_name
  location    = "US"
  storage_class = "NEARLINE"
}
```

## Inputs
- `bucket_name`: (required) Globally unique bucket name
- `location`: (optional) Bucket location (default: US)
- `storage_class`: (optional) Storage class (default: NEARLINE)

## Outputs
- `bucket_name`: Name of the bucket
- `bucket_url`: URL of the bucket



created by cloudgo.ai
