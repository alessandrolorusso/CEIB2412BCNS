variable "project" {
  type        = string
  description = "Project where private cloud will be deployed"
}
variable "gcve_region" {
  type        = string
  description = "Region where private cloud will be deployed"
}
variable "gcve_zone" {
  type        = string
  description = "Zone where private cloud will be deployed"
}
variable "vmware_engine_network_name" {
  type        = string
  description = "Name of the vmware engine network for the private cloud"
}

variable "vmware_engine_network_type" {
  type        = string
  description = "Type of the vmware engine network for the private cloud"
  default     = "LEGACY"
}

variable "vmware_engine_network_description" {
  type        = string
  description = "Description of the vmware engine network for the private cloud"
  default     = "PC Network"
}

variable "create_vmware_engine_network" {
  type        = bool
  description = "Set this value to true if you want to create a vmware engine network,"
}

variable "pc_name" {
  type        = string
  description = "Name of the private cloud that will be deployed"
}


variable "pc_cidr_range" {
  type        = string
  description = "CIDR range for the management network of the private cloud that will be deployed"
}

variable "pc_description" {
  type        = string
  description = "Description for the private cloud that will be deployed"
  default     = "Private Cloud description"
}

variable "cluster_id" {
  type        = string
  description = "The cluster ID for management cluster in the private cloud"
}

variable "cluster_node_type" {
  type        = string
  description = "Specify the node type for the management cluster in the private cloud"
  default     = "standard-72"
}

variable "cluster_node_count" {
  type        = number
  description = "Specify the number of nodes for the management cluster in the private cloud"
  default     = 3
}