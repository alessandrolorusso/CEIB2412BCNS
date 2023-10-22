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

data "vsphere_network" "network" {
  name          = "terraform-test-segment"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_content_library" "content_library" {
  name = "ContentLibrary"
}

data "vsphere_content_library_item" "bank-of-anthos-template" {
  name        = "Bank-Of-Anthos"
  library_id  = data.vsphere_content_library.content_library.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test"
  resource_pool_id = data.vsphere_resource_pool.default.id
  datastore_id     = data.vsphere_datastore.datastore.id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  clone {
    template_uuid = data.vsphere_content_library_item.item.id
  }

}