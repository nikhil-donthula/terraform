module "common" {
  source         = "../modules/common/"
  resource_group = var.resource_group
  location       = var.location
  environment    = var.environment
}

module "network" {
  source         = "../modules/network/"
  resource_group = module.common.resource_group
}
