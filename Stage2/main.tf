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

provider google {
  project = var.project
}

data "local_file" "vcenter-fqdn" {
  filename = "/workspace/vcenter-fqdn.txt"
}

data "google_secret_manager_secret_version_access" "vcenter-credential" {
  secret = var.secret
}

data "google_secret_manager_secret_version_access" "nsx-credential" {
  secret = var.nsxsecret
}
data "local_file" "nsx-fqdn" {
  filename = "/workspace/nsx-fqdn.txt"
}

provider "nsxt" {
  # Configuration options
  host                  = data.local_file.nsx-fqdn.content
  username              = "admin"
  password              = data.google_secret_manager_secret_version_access.nsx-credential.secret_data
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = data.google_secret_manager_secret_version_access.vcenter-credential.secret_data
  vsphere_server       = data.local_file.vcenter-fqdn.content
  allow_unverified_ssl = true
}


