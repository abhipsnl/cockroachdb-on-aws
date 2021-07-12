output "vpc-id" {
  value = module.create_cockroachdb_environment.vpc-id
}

output "id" {
  description = "List of IDs of instances"
  value       = module.create_cockroachdb_environment.id
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = module.create_cockroachdb_environment.availability_zone
}

output "key_name" {
  description = "List of key names of instances"
  value       = module.create_cockroachdb_environment.key_name
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.create_cockroachdb_environment.public_ip
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = module.create_cockroachdb_environment.private_ip
}

output "security_groups" {
  description = "List of associated security groups of instances"
  value       = module.create_cockroachdb_environment.security_groups
}

output "instance_state" {
  description = "List of instance states of instances"
  value       = module.create_cockroachdb_environment..instance_state
}

output "instance_count" {
  description = "Number of instances to launch specified as argument to this module"
  value       = var.instance_count
}
