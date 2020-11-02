module "git_server" {
  source                  = "../azure/vm"
  resource_group          = module.resource_group.name
  organisation            = var.organisation
  environment             = var.environment
  service_name            = local.service_name
  service_type            = "git_server"
  os_sku                  = "7-LVM"
  os_offer                = "RHEL"
  os_publisher            = "RedHat"
  region                  = var.azure_region
  custom_data_file_path   = var.custom_git_server_data_file_path
  subnet_id               = module.subnet.id
  public_ip_id            = module.public_ip.id
  public_key_openssh      = tls_private_key.ssh.public_key_openssh
}