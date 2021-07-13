resource "aws_instance" "cockroachdb-node" {
    count = var.instance_count
    ami = var.ami
    instance_type = var.instance_type

    # VPC
    subnet_id = aws_subnet.test-subnet-private-1.id

    # Security Group
    vpc_security_group_ids = [aws_security_group.cockroachdb-allowed.id]

    # the Public SSH key
    key_name = aws_key_pair.cockroachdb-key-pair.id

    tags = {
    Name  = "Terraform-${count.index + 1}"
    }
}

resource "aws_instance" "bastion_instance" {
  ami                    = var.ami
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.test-subnet-public.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = aws_key_pair.cockroachdb-key-pair.id

  tags = {
    Name        = "${terraform.workspace} bastion instance"
    Environment = "terraform.workspace"
    Creator     = "Terraform"
  }
}

// Sends your public key to the instance
resource "aws_key_pair" "cockroachdb-key-pair" {
    key_name = "cockroachdb-key-pair"
    public_key = file(var.public_key_path)
}

resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion_instance.id

  tags = {
    "Name" = "Bastion Elastic IP"
  }
}
