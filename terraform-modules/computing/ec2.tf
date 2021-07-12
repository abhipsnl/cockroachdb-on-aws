resource "aws_instance" "cockroachdb-node" {
    count = var.instance_count
    ami = lookup(var.ami, var.region)
    instance_type = "t2.micro"

    # VPC
    subnet_id = aws_subnet.test-subnet-public-1.id

    # Security Group
    vpc_security_group_ids = [aws_security_group.cockroachdb-allowed.id]

    # the Public SSH key
    key_name = aws_key_pair.cockroachdb-key-pair.id

    tags = {
    Name  = "Terraform-${count.index + 1}"
    }
    # nginx installation
    provisioner "file" {
        source = "../scripts/test.sh"
        destination = "/tmp/test.sh"
    }
    provisioner "remote-exec" {
        inline = [
             "chmod +x /tmp/test.sh",
             "sh /tmp/test.sh"
        ]
    }
    connection {
        user = var.ec2_user
        host = self.private_ip
        private_key = file(var.private_key_path)
    }
}

// Sends your public key to the instance
resource "aws_key_pair" "cockroachdb-key-pair" {
    key_name = "cockroachdb-key-pair"
    public_key = file(var.public_key_path)
}
