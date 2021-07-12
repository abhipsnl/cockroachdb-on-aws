variable "workspace_to_environment_map" {
  type = map
  description = "Map environments name for workspace"
  default = {
    dev     = "dev"
    qa      = "qa"
    staging = "staging"
    prod    = "prod"
  }
}

variable "environment_to_size_map" {
  type = map
  description = "Map Instance Size for env"
  default = {
    dev     = "small"
    qa      = "medium"
    staging = "large"
    prod    = "xlarge"
  }
}

variable "workspace_to_size_map" {
  type = map
  description = "Map instance size for local developers"
  default = {
    dev = "small"
  }
}

variable "environment_to_region_map" {
  type = map
  description = "Map region for env"
  default = {
    dev     = "ap-south-1"
    qa      = "us-east-1"
    staging = "us-east-1"
    prod    = "us-east-2"
  }
}

variable "environment_to_profile_map" {
  type = map
  description = "Map aws cli profile based on the workspace"
  default = {
    dev     = "aws-dev-profile"
    qa      = "aws-qa-profile"
    staging = "aws-staging-profile"
    prod    = "aws-prod-profile"
  }
}

variable "ami" {
    type = map

    default = {
        ap-south-1 = "ami-059d1007dcf297b22"
        eu-west-2 = "ami-03dea29b0216a1e03"
        us-east-1 = "ami-0c2a1acae6667e438"
    }
}

variable "instance_count" {
  type = map
  description = "Map instance count based on the workspace"
  default = {
    dev     = "2"
    qa      = "3"
    staging = "4"
    prod    = "6"
  }
}

variable "PRIVATE_KEY_PATH" {
  default = "../scripts/ssh/cockroachdb-node"
}

variable "PUBLIC_KEY_PATH" {
  default = "../scripts/ssh/cockroachdb-node.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}
