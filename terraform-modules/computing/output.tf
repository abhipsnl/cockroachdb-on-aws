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

output "bastion_public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.bastion_instance.*.public_ip
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

output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = concat(aws_lb.test_alb.*.dns_name, [""])[0]
}
