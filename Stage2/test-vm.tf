data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_datastore" "datastore" {
  name          = "vsanDatastore"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "cluster"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "default" {
  name          = "Workload"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_folder" "folder" {
  path          = "test-app"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

data "vsphere_content_library" "content_library" {
  name = "ContentLibrary"
}

resource "vsphere_content_library_item" "content_library_item" {
  name        = "Bank-Of-Anthos"
  description = "Bank Of Anthos Template"
  file_url    = var.ovfpath
  library_id  = data.vsphere_content_library.content_library.id
}