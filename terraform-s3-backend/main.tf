terraform {
  required_version = ">= 0.13.0"
}

provider "aws" {
  region = var.region
  profile = var.profile_name
}

module "tf_backend" {
  source = "git::https://github.com/sharmajee1/cockroachdb-on-aws.git//terraform-modules/s3-backend"

  bucket_prefix = var.prefix
  bucket_sse_algorithm = var.algorithm

  assume_policy = {}
}
