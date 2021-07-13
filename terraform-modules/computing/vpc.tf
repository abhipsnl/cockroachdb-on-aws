resource "aws_vpc" "test-vpc" {
    cidr_block = var.vpc_cidr_map
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    
    tags = {
        Name = "test-vpc"
    }
}

resource "aws_subnet" "test-subnet-public" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = var.public_subnet_map
    map_public_ip_on_launch = "true" //it makes this a public subnet

    tags = {
        Name = "test-subnet-public"
    }
}

resource "aws_subnet" "test-subnet-private-1" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = var.private_subnet_map_1
    map_public_ip_on_launch = "false" //it makes this a public subnet

    tags = {
        Name = "test-subnet-private-1"
    }
}

resource "aws_subnet" "test-subnet-private-2" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = private_subnet_map_2
    map_public_ip_on_launch = "false" //it makes this a public subnet

    tags = {
        Name = "test-subnet-private-2"
    }
}
