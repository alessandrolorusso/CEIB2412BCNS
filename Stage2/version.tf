terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
    nsxt = {
      source = "vmware/nsxt"
    }
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.4.0"
    }
  }
  backend "gcs" {
      prefix="stage2"
    }
}