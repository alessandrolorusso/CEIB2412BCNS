// NSX-T Segments
segments = [
  {
    description  = "vmware-explore-subnet1"
    display_name = "vmware-explore-subnet1"
    cidr         = "10.123.1.1/24"
    tags = {
      tier        = "web",
      environment = "dev"
    }
  },
  {
    description  = "vmware-explore-subnet2"
    display_name = "vmware-explore-subnet2"
    cidr         = "10.123.2.1/24"
    tags = {
      tier        = "backend",
      environment = "dev"
    }
  }
]

// NSX-T gateway firewall
gwf_policies = [
  {
    display_name = "gwf_allow_policy"
    rules = [
      {
        action             = "ALLOW"
        destination_groups = ["10.123.1.0/24"]
        source_groups      = ["10.100.0.0-10.100.0.128"]
        direction          = "IN_OUT"
        display_name       = "gwf-allow-ssh"
        logged             = false
        services           = ["SSH"]
      },
      {
        action             = "ALLOW"
        destination_groups = ["10.123.2.0/23"]
        source_groups      = []
        direction          = "IN_OUT"
        display_name       = "gfw-allow-dns"
        logged             = false
        services           = ["DNS"]
      },
    ]
  },
  {
    display_name    = "gwf_drop_policy"
    sequence_number = 1000
    rules = [
      {
        action             = "DROP"
        destination_groups = ["10.123.2.0/23"]
        source_groups      = []
        direction          = "IN"
        display_name       = "gfw-drop-all"
        logged             = false
        services           = []
      }
    ]
  },
]

// NSX-T distributed firewall
dfw_policies = [
  {
    display_name    = "dfw_allow_policy"
    sequence_number = 1
    rules = [
      {
        action             = "ALLOW"
        destination_groups = ["10.123.1.0/24"]
        source_groups      = []
        direction          = "IN_OUT"
        display_name       = "dfw-allow-ssh"
        logged             = false
        services           = ["SSH"]
      },
      {
        action             = "ALLOW"
        destination_groups = ["10.123.2.0/23"]
        source_groups      = ["10.200.1.0-10.200.1.128"]
        direction          = "IN_OUT"
        display_name       = "dfw-allow-dns"
        logged             = false
        services           = ["DNS"]
      },
    ]
  },
  {
    display_name    = "dfw_baseline_deny_policy"
    sequence_number = 1000
    rules = [
      {
        action             = "DROP"
        destination_groups = []
        source_groups      = []
        direction          = "IN"
        display_name       = "dfw-drop-all"
        logged             = false
        services           = []
      }
    ]
  },
]
