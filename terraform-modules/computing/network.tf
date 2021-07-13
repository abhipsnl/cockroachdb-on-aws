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

resource "aws_lb" "alb" {
  name               = terraform.workspace-cockroachdb-lb
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.test-subnet-public-1.id, aws_subnet.test-subnet-private-1.id]

  enable_deletion_protection = false

  tags = {
    Name = terraform.workspace-cockroachdb-lb
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
  name     = terraform.workspace-cockroachdb-service-tg
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
