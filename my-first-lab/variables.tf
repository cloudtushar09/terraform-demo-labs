variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-terraform-lab"
}

variable "vm_name" {
  description = "Name of the Linux virtual machine"
  type        = string
  default     = "vm-terraform-lab"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_D2as_v7"
}