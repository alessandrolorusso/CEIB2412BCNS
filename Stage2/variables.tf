variable "project" {
   description = "Project ID for Lab"
   type = string
}

variable "secret" {
   description = "Secret with vCenter Credential"
   type = string
}

variable "vsphere_user" {
   description = "vSphere User"
   type = string
   default = "CloudOwner@gve.local"
}

variable "nsx_user" {
   description = "NSX User"
   type = string
   default = "admin"
}

variable "nsxsecret" {
   description = "Secret with NSX Credential"
   type = string
}

variable "edge_cluster_name" {
  description = "The name of the NSX-T Edge Cluster."
  type        = string
  default     = "edge-cluster" # < This is the GCVE default
}

variable "segments" {
  description = "An list of segment configuration objects used to create segments."
  type = list(object({
    description  = string
    display_name = string
    cidr         = string
    tags         = map(string)
  }))
}

variable "transport_zone_name" {
  description = "The name of the NSX-T Transport Zone."
  type        = string
  default     = "TZ-OVERLAY" # < This is the GCVE default
}

variable "tier0_gateway_name" {
  description = "The name of the NSX-T tier0 gateway."
  type        = string
  default     = "Provider-LR" # < This is the GCVE default
}

variable "tier1_gateway_name" {
  description = "The name of the NSX-T tier1 gateway."
  type        = string
  default     = "Tier1" # < This is the GCVE default
}

variable "gwf_policies" {
  description = "A list of firewall configuration objects used to add firewall rules to the Tier1 Gateway."
  type = list(object({
    display_name = string
    rules = list(object({
      display_name       = string
      action             = string
      direction          = string
      logged             = bool
      services           = list(string)
      destination_groups = list(string)
      source_groups      = list(string)
    }))
  }))
  default = []
}

variable "dfw_policies" {
  description = "A list of firewall configuration objects used to add firewall rules to the Tier1 Gateway."
  type = list(object({
    display_name    = string
    sequence_number = number
    rules = list(object({
      display_name       = string
      action             = string
      direction          = string
      logged             = bool
      services           = list(string)
      destination_groups = list(string)
      source_groups      = list(string)
    }))
  }))
  default = []
}

variable "vsphere_resource_pool_config" {
  description = "All Vsphere Resource Pool Configs"
  type = map(object({
    datacenter       = string,
    location         = string,
    role_assignments = any,
  }))
}
