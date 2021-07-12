provider "aws" {
  region  = lookup(var.environment_to_region_map, terraform.workspace, "us-east-1")
  profile = lookup(var.environment_to_profile_map, terraform.workspace, "default")
}
