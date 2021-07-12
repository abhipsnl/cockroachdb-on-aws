resource "aws_internet_gateway" "test-igw" {
    vpc_id = aws_vpc.test-vpc.id
    tags = {
        Name = "test-igw"
    }
}

resource "aws_route_table" "test-public-crt" {
    vpc_id = aws_vpc.test-vpc.id
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.test-igw.id
    }
    
    tags = {
        Name = "test-public-crt"
    }
}

resource "aws_route_table_association" "test-crta-public-subnet-1"{
    subnet_id = aws_subnet.test-subnet-public-1.id
    route_table_id = aws_route_table.test-public-crt.id
}

resource "aws_security_group" "cockroachdb-allowed" {
    vpc_id = aws_vpc.test-vpc.id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 26257
        to_port = 26257
        protocol = "tcp"
        // This means, all ip address are allowed to ssh ! 
        // Do not do it in the production. 
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }
    //If you do not add this rule, you can not reach the console
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh !
        // Do not do it in the production.
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "cockroachdb-allowed"
    }
}
