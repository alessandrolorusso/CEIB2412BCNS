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
  }
}

provider google-beta {
  project = var.project
}

resource "google_vmwareengine_private_cloud" "vmw-engine-pc" {
  provider    = google-beta
  location    = "europe-west12-a"
  name        = "vmware-explore-pc"
  description = "VMware Explore Demo environment"
  network_config {
    management_cidr       = "10.42.0.0/22"
    vmware_engine_network = google_vmwareengine_network.turin-network.id
  }

  management_cluster {
    cluster_id = "cluster"
    node_type_configs {
      node_type_id = "standard-72"
      node_count   = 4
    }
  }
}

resource "google_vmwareengine_network" "turin-network" {
  provider    = google-beta
  name        = "europe-west12-default"
  location    = "europe-west12"
  type        = "LEGACY"
  description = "PC network description."
}
