resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-github-module"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.20.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-github-module"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.20.1.0/24"]
}
module "linux_vm" {
  source = "git::https://github.com/cloudtushar09/terraform-demo-labs.git//terraform-module-lab/modules/linux-vm"

  vm_name             = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vm_size             = var.vm_size
  subnet_id           = azurerm_subnet.subnet.id
}