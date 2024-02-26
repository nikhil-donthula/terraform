variable "resource_group" {
  default     = "bottleTFResourceGroup"
 
  description = "name of resource group"
}

variable "location" {
  default     = "eastus2"
  type        = string
  description = "region like West US or Central India"
}


# Networking
# variable "virtual_network_name" {
#   description = "virtual network name"
#   type        = string
# }

# variable "subnet_type" {
#   description = "subnet type"
#   type        = string
# }

# variable "cidrs" {
#   description = "CIDRs for subnet"
#   type        = list(string)
# }

variable "create_network_security_group" {
  description = "Create/associate network security group"
  type        = bool
  default     = true
}

variable "configure_nsg_rules" {
  description = "Configure network security group rules"
  type        = bool
  default     = true
}

variable "allow_internet_outbound" {
  description = "allow outbound traffic to internet"
  type        = bool
  default     = true
}

variable "allow_lb_inbound" {
  description = "allow inbound traffic from Azure Load Balancer"
  type        = bool
  default     = true
}

variable "allow_vnet_inbound" {
  description = "allow all inbound from virtual network"
  type        = bool
  default     = true
}

variable "allow_vnet_outbound" {
  description = "allow all outbound from virtual network"
  type        = bool
  default     = true
}