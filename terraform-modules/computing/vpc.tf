resource "aws_vpc" "test-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    
    tags = {
        Name = "test-vpc"
    }
}

resource "aws_subnet" "test-subnet-public-1" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet

    tags = {
        Name = "test-subnet-public-1"
    }
}

resource "aws_subnet" "test-subnet-private-1" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "false" //it makes this a public subnet

    tags = {
        Name = "test-subnet-private-1"
    }
}
