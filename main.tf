terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "gcp-terraform-project-420321"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "gcp-terraform-project-420321-f2cc606dad59.json"
}

resource "google_storage_bucket" "gcpgentleman" {
  name          = "saturdays-in-theos-gcp-class"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}