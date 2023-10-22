variable "project" {
   description = "Project ID for Lab"
   type = string
}

variable "secret" {
   description = "Secret with vCenter Credential"
   type = string
}

variable "ovfpath" {
   description = "Path Golden Image"
   type = string
}

variable "vsphere_user" {
   description = "vSphere User"
   type = string
   default = "CloudOwner@gve.local"
}

variable "nsxsecret" {
   description = "Secret with NSX Credential"
   type = string
}