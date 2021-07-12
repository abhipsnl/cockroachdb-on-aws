locals {
  environment = lookup(var.workspace_to_environment_map, terraform.workspace, "dev")
  size = local.environment == "dev" ? lookup(var.workspace_to_size_map, terraform.workspace, "small") : var.environment_to_size_map[local.environment]
  region = local.environment == "dev" ? lookup(var.environment_to_region_map, terraform.workspace, "ap-south-1") : var.environment_to_region_map[local.environment]
  ami = var.ami[local.region]
  count = lookup(var.instance_count, terraform.workspace, "2")
}

module "create_vpc" {
  source = "git::https://github.com/sharmajee1/cockroachdb-on-aws.git//terraform-modules/computing"
  
  cidr_block = "10.0.0.0/16"
}
