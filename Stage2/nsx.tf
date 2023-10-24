data "nsxt_policy_edge_cluster" "this" {
  display_name = var.edge_cluster_name
}

data "nsxt_policy_tier0_gateway" "this" {
  display_name = var.tier0_gateway_name
}

data "nsxt_policy_tier1_gateway" "this" {
  display_name = var.tier1_gateway_name
}

data "nsxt_policy_transport_zone" "transport_zone" {
  display_name = var.transport_zone_name
}

module "vm_segments" {
  source   = "github.com/GoogleCloudPlatform/gcve-iac-foundations/modules/nsxt-segment/"
  for_each = { for k, v in var.segments : v.display_name => v }

  connectivity_path    = data.nsxt_policy_tier1_gateway.this.path
  display_name         = each.value.display_name
  resource_description = each.value.description
  segment_cidr         = each.value.cidr
  tags                 = each.value.tags
  transport_zone_path  = data.nsxt_policy_transport_zone.transport_zone.path
}

module "gwf_policies" {
  depends_on = [module.vm_segments]
  source     = "github.com/GoogleCloudPlatform/gcve-iac-foundations/modules/nsxt-gateway-firewall/"
  for_each   = { for k, v in var.gwf_policies : v.display_name => v }

  display_name = each.value.display_name
  rules        = each.value.rules
  scope_path   = data.nsxt_policy_tier1_gateway.this.path
}

module "dfw_policies" {
  depends_on = [module.vm_segments]
  source     = "github.com/GoogleCloudPlatform/gcve-iac-foundations/modules/nsxt-distributed-firewall-policy/"
  for_each   = { for k, v in var.dfw_policies : v.display_name => v }

  display_name    = each.value.display_name
  sequence_number = each.value.sequence_number
  rules           = each.value.rules
  scope           = []
}