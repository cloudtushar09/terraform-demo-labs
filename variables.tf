variable "location" {
  type    = string
  default = "eastus"
}

variable "resource_group_name" {
  type    = string
  default = "rg-terraform-github-module"
}

variable "vm_name" {
  type    = string
  default = "vm-github-module"
}

variable "vm_size" {
  type    = string
  default = "Standard_D2as_v7"
}