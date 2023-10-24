module "gcve-private-cloud" {
  source                            = "github.com/GoogleCloudPlatform/gcve-iac-foundations/modules/gcve-private-cloud"
  project                           = var.project
  gcve_region                       = var.gcve_region
  gcve_zone                         = var.gcve_zone
  vmware_engine_network_name        = var.vmware_engine_network_name
  vmware_engine_network_type        = var.vmware_engine_network_type
  vmware_engine_network_description = var.vmware_engine_network_description
  create_vmware_engine_network      = var.create_vmware_engine_network
  pc_name                           = var.pc_name
  pc_cidr_range                     = var.pc_cidr_range
  pc_description                    = var.pc_description
  cluster_id                        = var.cluster_id
  cluster_node_type                 = var.cluster_node_type
  cluster_node_count                = var.cluster_node_count
}