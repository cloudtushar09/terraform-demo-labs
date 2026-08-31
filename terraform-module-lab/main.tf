resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-module-lab"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-module-lab"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.1.0/24"]
}

module "linux_vm" {
  source = "./modules/linux-vm"

  vm_name             = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vm_size             = var.vm_size
  subnet_id           = azurerm_subnet.subnet.id
}
module "linux_vm_2" {
  source = "./modules/linux-vm"

  vm_name             = "vm-module-lab-02"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vm_size             = var.vm_size
  subnet_id           = azurerm_subnet.subnet.id
}