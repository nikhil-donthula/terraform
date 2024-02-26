
resource "azurerm_network_security_group" "nsg" {
  count = (var.create_network_security_group ? 1 : 0)

  name                = "TestSecurityGroup1"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  tags = {
    managed_by = "terraform"
    environment = "DEV"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet-nsg-assoc" {
  subnet_id                 = azurerm_subnet.public-subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.0.id
}