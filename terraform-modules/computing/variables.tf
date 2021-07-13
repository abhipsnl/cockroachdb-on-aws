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
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_cidr_map" {
  type = string
}

variable "public_subnet_map" {
  type = string
}

variable "private_subnet_map_1" {
  type = string
}

variable "private_subnet_map_2" {
  type = string
}

variable "cockroach_binary" {
  default = ""
}

# SHA of the cockroach binary to pull down. If none, the latest is fetched.
variable "cockroach_sha" {
  default = ""
}
