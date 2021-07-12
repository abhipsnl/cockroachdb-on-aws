variable "region" {
    type = string
}

variable "ami" {
    type = string
}

variable "instance_count" {
  type = string
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

variable "instance_type" {
  type = string
}
