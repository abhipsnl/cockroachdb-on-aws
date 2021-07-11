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
    dev     = "us-east-1"
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
