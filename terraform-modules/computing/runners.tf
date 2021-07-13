resource "null_resource" "bastion-runner" {

  depends_on = [null_resource.cockroach-runner]

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file(var.private_key_path)
    host = aws_eip.bastion_eip.public_ip
  }

  provisioner "file" {
    source = "../scripts/setup-cockroach.sh"
    destination = "/home/ubuntu/setup-cockroach.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nethogs",
      "mkdir -p logs",
      "chmod 755 cockroach",
      "chmod +x /home/ubuntu/setup-cockroach.sh",
      "[ $(stat --format=%s cockroach) -ne 0 ] || sudo bash setup-cockroach.sh cockroach/cockroach var.cockroach_sha",
      "cockroach init --insecure --host=aws_instance.cockroachdb-node[0].private_ip}"
    ]
  }
}

resource "null_resource" "cockroach-runner" {
  count = var.instance_count

  depends_on = [aws_eip.bastion_eip]

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file(var.private_key_path)
    host = element(aws_instance.cockroachdb-node.*.private_ip, count.index)
    bastion_host = aws_eip.bastion_eip.public_ip
    bastion_user = "ubuntu"
    bastion_private_key = file(var.private_key_path)
  }

  provisioner "file" {
    source = "../scripts/setup-cockroach.sh"
    destination = "/home/ubuntu/setup-cockroach.sh"
  }

  provisioner "file" {
    source = coalesce(var.cockroach_binary, "/dev/null")
    destination = "/home/ubuntu/cockroach"
  }

  # Synchronize clocks and Launch CockroachDB.
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/setup-cockroach.sh",
      "sudo apt-get -y update",
      "sudo apt install -y chrony",
      "sudo sed  -i '1i server 169.254.169.123 prefer iburst minpoll 4 maxpoll 4' /etc/chrony/chrony.conf",
      "sudo /etc/init.d/chrony restart",
      "sudo apt-get -y install nethogs",
      "mkdir -p logs",
      "chmod 755 cockroach",
      "[ $(stat --format=%s cockroach) -ne 0 ] || sudo bash setup-cockroach.sh cockroach/cockroach var.cockroach_sha",
      "cockroach start --insecure --advertise-addr=element(aws_instance.cockroachdb-node.*.private_ip, count.index)} --join=join(",", aws_instance.cockroachdb-node.*.private_ip) --cache=.25 --max-sql-memory=.25 --background"
    ]
  }
}
