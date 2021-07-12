variable "region" {
    type = string
}

variable "ami" {
    type = map
    
    default = {
        eu-west-2 = "ami-03dea29b0216a1e03"
        us-east-1 = "ami-0c2a1acae6667e438"
    }
}

variable "instance_count" {
  default = "2"
}

variable "private_key_path" {
  type = string
}

variable "public_key_path" {
  type = string
}

variable "ec2_user" {
  default = "ubuntu"
}
