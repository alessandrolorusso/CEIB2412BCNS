vsphere_resource_pool_config = {
  dev-resource-pool = {
    datacenter = "Datacenter",
    location   = "Cluster/cluster",
    role_assignments = {
      permission1 = {
        user_or_group = "vsphere.local\\DCClients"
        is_group      = true
        propagate     = true
        role          = "Monitoring-Role"
      },
      permission2 = {
        user_or_group = "vsphere.local\\DCClients"
        is_group      = true
        propagate     = true
        role          = "Monitoring-Role"
      },
    },
  },
  uat-resource-pool = {
    datacenter = "Datacenter",
    location   = "Cluster/cluster",
    role_assignments = {
      permission1 = {
        user_or_group = "vsphere.local\\DCClients"
        is_group      = true
        propagate     = true
        role          = "No access"
      },
      permission2 = {
        user_or_group = "vsphere.local\\DCClients"
        is_group      = true
        propagate     = true
        role          = "No access"
      },
    },
  },
  prod-resource-pool = {
    datacenter = "Datacenter",
    location   = "Cluster/cluster",
    role_assignments = {
      permission1 = {
        user_or_group = "vsphere.local\\DCClients"
        is_group      = true
        propagate     = true
        role          = "Monitoring-Role"
      },
      permission2 = {
        user_or_group = "vsphere.local\\DCClients"
        is_group      = true
        propagate     = true
        role          = "Monitoring-Role"
      },
    },
  },
}
