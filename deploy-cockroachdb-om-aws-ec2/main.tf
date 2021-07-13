locals {
  environment = lookup(var.workspace_to_environment_map, terraform.workspace, "dev")
  size = local.environment == "dev" ? lookup(var.workspace_to_size_map, terraform.workspace, "small") : var.environment_to_size_map[local.environment]
  region = local.environment == "dev" ? lookup(var.environment_to_region_map, terraform.workspace, "ap-south-1") : var.environment_to_region_map[local.environment]
  ami = var.ami[local.region]
  count = lookup(var.instance_count, terraform.workspace, "2")
  instance_type = var.instance_type[local.environment]
}

module "create_cockroachdb_environment" {
  source = "git::https://github.com/sharmajee1/cockroachdb-on-aws.git//terraform-modules/computing"
  
  private_key_path = var.private_key_path
  public_key_path = var.public_key_path
  region = local.region
  instance_count = local.count
  ami = local.ami
  instance_type = local.instance_type
  ec2_user = var.ec2_user
  cidr_block = var.vpc_cidr_map[terraform.workspace]
}
