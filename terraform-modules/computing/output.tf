output "vpc-id" {
  value = aws_vpc.test-vpc.id
}

output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.cockroachdb-node.*.id
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = aws_instance.cockroachdb-node.*.availability_zone
}

output "key_name" {
  description = "List of key names of instances"
  value       = aws_instance.cockroachdb-node.*.key_name
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.cockroachdb-node.*.public_ip
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.cockroachdb-node.*.private_ip
}

output "security_groups" {
  description = "List of associated security groups of instances"
  value       = aws_instance.cockroachdb-node.*.security_groups
}

output "instance_state" {
  description = "List of instance states of instances"
  value       = aws_instance.cockroachdb-node.*.instance_state
}

output "instance_count" {
  description = "Number of instances to launch specified as argument to this module"
  value       = var.instance_count
}
