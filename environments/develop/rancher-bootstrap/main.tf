
terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-resource-group"
    storage_account_name = "gwtfstatestorageaccount"
    container_name       = "tfstatecontainer"
    key                  = "gw-rancher-develop-terraform.tfstate"
  }
}

module "rancher_server" {
  source                 = "../../../workspace/rancher-bootstrap"
  environment            = "dev"
  project                = "rancher-server"
  suffix                 = "z1"
}