provider "aws" {
  region  = lookup(var.environment_to_region_map, terraform.workspace, "us-east-1")
  profile = lookup(var.environment_to_profile_map, terraform.workspace, "default")
}

terraform {
  backend "s3" {
    bucket         = abhishek-terraform-backend
    region         = ap-south-1
    key            = "terraform-state"
    dynamodb_table = "terraform-lock"
  }
}
