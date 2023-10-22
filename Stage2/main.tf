terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.1.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
  backend "gcs" {
      prefix="stage2"
    }
}

