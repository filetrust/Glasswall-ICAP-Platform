
terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-resource-group"
    storage_account_name = "gwtfstatestorageaccount"
    container_name       = "tfstatecontainer"
    key                  = "gw-rancher-clusters-develop-terraform.tfstate"
  }
}

module "rancher_clusters" {
    source              = "../../../workspace/proto-multi-clusters"
    environment         = "dev"
    branch              = "develop"
    #cluster quantity is 1 per region
    icap_cluster_quantity                      = 1
    icap_master_scaleset_sku_capacity          = 1
    icap_worker_scaleset_sku_capacity          = 1
}

