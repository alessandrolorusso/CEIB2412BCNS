output "gcve_tf_pc" {
  description = "The private cloud resource"
  value       = module.gcve-private-cloud.gcve_tf_pc
}

output "hcx" {
  description = "Details about the HCX Manager appliance"
  value       = module.gcve-private-cloud.hcx
}

output "nsx" {
  description = "Details about the NSX Manager appliance"
  value       = module.gcve-private-cloud.nsx
}

output "vcenter" {
  description = "Details about the vCenter appliance"
  value       = module.gcve-private-cloud.vcenter
}

output "id" {
  description = "ID of the private cloud"
  value       = module.gcve-private-cloud.id
}

output "management_cluster" {
  description = "Details of the management cluster of the private cloud"
  value       = module.gcve-private-cloud.management_cluster
}

output "network_config" {
  description = "Details about the network configuration of the private cloud"
  value       = module.gcve-private-cloud.network_config
}

output "state" {
  description = "Details about the state of the private cloud"
  value       = module.gcve-private-cloud.state
}