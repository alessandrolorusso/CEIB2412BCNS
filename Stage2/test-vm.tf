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
  name          = nsxt_policy_fixed_segment.terraform-test.display_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
