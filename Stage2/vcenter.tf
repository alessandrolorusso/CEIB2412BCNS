module "resource_pool" {
  for_each = var.vsphere_resource_pool_config
  source   = "github.com/GoogleCloudPlatform/gcve-iac-foundations/modules/vcenter-resource-pool"

  name             = each.key
  datacenter       = each.value.datacenter
  parent_path      = each.value.location
  role_assignments = each.value.role_assignments
}