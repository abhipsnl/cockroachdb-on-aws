variable "workspace_to_environment_map" {
  type = map
  description = "Map environments name for workspace"
  default = {
    default = "dev"
    dev     = "dev"
    qa      = "qa"
    staging = "staging"
    prod    = "prod"
  }
}

variable "environment_to_region_map" {
  type = map
  description = "Map region for env"
  default = {
    default = "us-east-1"
    dev     = "us-east-2"
    qa      = "us-east-2"
    staging = "us-west-1"
    prod    = "ap-south-1"
  }
}

variable "environment_to_profile_map" {
  type = map
  description = "Map aws cli profile based on the workspace"
  default = {
    default = "dev"
    dev     = "dev"
    qa      = "aws-qa-profile"
    staging = "aws-staging-profile"
    prod    = "aws-prod-profile"
  }
}

variable "ami" {
    type = map

    default = {
        default    = "ami-008a8487adc2b32ec"
        ap-south-1 = "ami-059d1007dcf297b22"
        us-east-2  = "ami-02de934ca4f3289e0"
        us-east-1  = "ami-008a8487adc2b32ec"
    }
}

variable "instance_count" {
  type = map
  description = "Map instance count based on the workspace"
  default = {
    default = "2"
    dev     = "2"
    qa      = "3"
    staging = "4"
    prod    = "6"
  }
}

variable "private_key_path" {
  default = "/Users/abhishek.sh/personal-proj/cockroachdb-on-aws/scripts/ssh/cockroachdb-node"
}

variable "public_key_path" {
  default = "/Users/abhishek.sh/personal-proj/cockroachdb-on-aws/scripts/ssh/cockroachdb-node.pub"
}

variable "ec2_user" {
  default = "ubuntu"
}

variable "instance_type" {
  type = map
  description = "Map instance type based on the workspace"
  default = {
    dev     = "c5d.4xlarge"
    qa      = "c5d.4xlarge"
    staging = "c5d.4xlarge"
    prod    = "c5d.4xlarge"
  }
}


variable "vpc_cidr_map" {
  type = map
  default = {
    default     = "10.18.0.0/16"
    dev         = "10.18.0.0/16"
    staging     = "10.19.0.0/16"
    prod        = "10.20.0.0/16"
  }
}

variable "public_subnet_map" {
  type = map
  default = {
    default     = "10.18.0.0/22"
    dev         = "10.18.0.0/22"
    staging     = "10.19.0.0/22"
    prod        = "10.20.0.0/22"
  }
}

variable "private_subnet_map_1" {
  type = map
  default = {
    default      = "10.18.8.0/22"
    dev          = "10.18.8.0/22"
    staging      = "10.19.8.0/22"
    prod         = "10.20.8.0/22"
  }
}

variable "private_subnet_map_2" {
  type = map
  default = {
    default     = "10.18.12.0/22"
    dev         = "10.18.12.0/22"
    staging     = "10.19.12.0/22"
    prod        = "10.20.12.0/22"
  }
}
