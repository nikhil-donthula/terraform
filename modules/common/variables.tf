variable "resource_group" {
  default     = "bottleTFResourceGroup"
  description = "name of resource group"
}

variable "environment" {
  default     = "DEV"
  type        = string
  description = "env tag like prod, dev, UAT"
}

variable "location" {
  default     = "eastus2"
  type        = string
  description = "region like West US or Central India"
}
