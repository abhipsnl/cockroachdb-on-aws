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

resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.test-vpc.id
  tags = {
    Name        = "test-igw"
  }
}

resource "aws_eip" "test-nat" {
  vpc = true
  tags = {
    Name        = "test-nat"
  }
}

resource "aws_nat_gateway" "test-ngw" {
  allocation_id = aws_eip.test-nat.id
  subnet_id     = aws_subnet.test_public_subnet.id

  tags = {
    Name        = "test-ngw"
  }
}

resource "aws_route_table" "test_igw_rt" {
  vpc_id = aws_vpc.test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-igw.id
  }

  tags = {
    Name        = "est_igw_rt"
  }
}

resource "aws_route_table" "test_nat_rt_1" {
  vpc_id = aws_vpc.test-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.test-ngw.id
  }

  tags = {
    Name        = "test_nat_rt_1"
  }
}

resource "aws_route_table" "test_nat_rt_2" {
  vpc_id = aws_vpc.test-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.test-ngw.id
  }

  tags = {
    Name        = "test_nat_rt_2"
  }
}


resource "aws_subnet" "test_public_subnet" {
  vpc_id            = aws_vpc.test-vpc.id
  cidr_block        = var.public_subnet_map
  availability_zone = "${var.region}a"
  depends_on        = ["aws_internet_gateway.test-igw"]

  tags = {
    Name        = "test_public_subnet"
  }
}


resource "aws_subnet" "test_private_subnet_1" {
  vpc_id            = aws_vpc.test-vpc.id
  cidr_block        = var.private_subnet_map_1
  availability_zone = "${var.region}a"

  tags = {
    Name        = "test_private_subnet_1"
  }
}

resource "aws_subnet" "test_private_subnet_2" {
  vpc_id            = aws_vpc.test-vpc.id
  cidr_block        = var.private_subnet_map_2
  availability_zone = "${var.region}b"

  tags = {
    Name        = "test_private_subnet_2"
  }
}

resource "aws_route_table_association" "test_public" {
  subnet_id      = aws_subnet.test_public_subnet.id
  route_table_id = aws_route_table.test_igw_rt.id
}

resource "aws_route_table_association" "test_private_1" {
  subnet_id      = aws_subnet.test_private_subnet_1.id
  route_table_id = aws_route_table.test_nat_rt_1.id
}

resource "aws_route_table_association" "test_private_2" {
  subnet_id      = aws_subnet.test_private_subnet_2.id
  route_table_id = aws_route_table.test_nat_rt_2.id
}


resource "aws_security_group" "cockroachdb-allowed" {
    vpc_id = aws_vpc.test-vpc.id
    name   = "${terraform.workspace} cockroachdb Security Group"
    
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


resource "aws_security_group" "bastion_sg" {
  name   = "${terraform.workspace} Bastion Security Group"
  vpc_id = aws_vpc.test-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8008
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "alb" {
  name               = "${terraform.workspace}-cockroachdb-lb"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.test-subnet-private-1.id, aws_subnet.test-subnet-private-2.id]

  enable_deletion_protection = false

  tags = {
    Name = "${terraform.workspace}-cockroachdb-lb"
    Environment = terraform.workspace
    Creator     = "Terraform"
  }
}

resource "aws_alb_listener" "cockroachdb_service_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "26257"
  protocol          = "TCP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cockroachdb_service_tg.arn
  }
}

resource "aws_lb_target_group" "cockroachdb_service_tg" {
  name     = "${terraform.workspace}-cockroachdb-service-tg"
  port     = 26257
  protocol = "TCP"
  vpc_id   = aws_vpc.test-vpc.id

  health_check {
    path = "/health?ready=1"
    port = 8080
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "cockroachdb_service_tg_attachment" {
  count = var.instance_count
  target_group_arn = aws_lb_target_group.cockroachdb_service_tg.arn
  target_id        = element(aws_instance.cockroachdb-node.*.id, count.index)
  port             = 26257
}
