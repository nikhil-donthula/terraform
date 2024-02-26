resource "azurerm_network_security_rule" "deny_all_inbound" {
  count                       = ((var.create_network_security_group && var.configure_nsg_rules) ? 1 : 0)

  name                        = "DenyAllInbound"
  priority                    = 4096
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.nsg.0.name
}

resource "azurerm_network_security_rule" "deny_all_outbound" {
  count                       = ((var.create_network_security_group && var.configure_nsg_rules) ? 1 : 0)

  name                        = "DenyAllOutbound"
  priority                    = 4096
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.nsg.0.name
}

resource "azurerm_network_security_rule" "allow_lb_inbound" {
  count                       = ((var.create_network_security_group && var.configure_nsg_rules && var.allow_lb_inbound) ? 1 : 0)

  name                        = "AllowAzureLoadBalancerIn"
  priority                    = 4095
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.nsg.0.name
}

resource "azurerm_network_security_rule" "allow_internet_outbound" {
  count                       = ((var.create_network_security_group && var.configure_nsg_rules && var.allow_internet_outbound) ? 1 : 0)

  name                        = "AllowInternetOut"
  priority                    = 4095
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.nsg.0.name
}

resource "azurerm_network_security_rule" "allow_vnet_inbound" {
  count                       = ((var.create_network_security_group && var.configure_nsg_rules && var.allow_vnet_inbound) ? 1 : 0)

  name                        = "AllowVnetIn"
  priority                    = 4094
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.nsg.0.name
}

resource "azurerm_network_security_rule" "allow_vnet_outbound" {
  count                       = ((var.create_network_security_group && var.configure_nsg_rules && var.allow_vnet_outbound) ? 1 : 0)

  name                        = "AllowVnetOut"
  priority                    = 4094
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.nsg.0.name
}