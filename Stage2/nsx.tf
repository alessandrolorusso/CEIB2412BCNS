data "nsxt_policy_tier1_gateway" "t1_gateway" {
  display_name = "Tier1"
}

data "nsxt_policy_transport_zone" "overlay_tz" {
  display_name = "TZ-OVERLAY"
}

data "nsxt_policy_edge_cluster" "edge-cluster" {
  display_name = "edge-cluster"
}

resource "nsxt_policy_dhcp_server" "tier_dhcp" {
  display_name     = "tier_dhcp"
  description      = "DHCP server"
  edge_cluster_path = data.nsxt_policy_edge_cluster.edge-cluster.path
  server_addresses = ["192.168.156.1/30"]
}

resource "nsxt_policy_fixed_segment" "terraform-test" {
  display_name        = "terraform-test-segment"
  description         = "Terraform provisioned Test Segment"
  connectivity_path   = data.nsxt_policy_tier1_gateway.t1_gateway.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path
  dhcp_config_path    = nsxt_policy_dhcp_server.tier_dhcp.path

  subnet {
    cidr        = "192.168.155.1/24"
    dhcp_ranges  = ["192.168.155.10-192.168.155.100"]
    dhcp_v4_config {
        dns_servers = ["192.168.155.3"]
        server_address = "192.168.155.2/24"
      }
    }
}