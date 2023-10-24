terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.1.0"
    }
  }
  backend "gcs" {
  }
}