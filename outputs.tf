output "vpc_endpoint_id" {
  description = "The ID of the VPC Endpoint."
  value       = try(aws_vpc_endpoint.this[0].id, "")
}

output "vpc_endpoint_arn" {
  description = "The ARN of the VPC Endpoint."
  value       = try(aws_vpc_endpoint.this[0].arn, "")
}

output "dns_entry" {
  description = "DNS entries for the VPC Endpoint."
  value       = try(aws_vpc_endpoint.this[0].dns_entry, [])
}

output "network_interface_ids" {
  description = "Network interface IDs for Interface endpoints."
  value       = try(aws_vpc_endpoint.this[0].network_interface_ids, [])
}

output "prefix_list_id" {
  description = "Prefix list ID for Gateway endpoints."
  value       = try(aws_vpc_endpoint.this[0].prefix_list_id, "")
}

output "state" {
  description = "The state of the VPC Endpoint."
  value       = try(aws_vpc_endpoint.this[0].state, "")
}

output "enabled" {
  description = "Whether the module is enabled."
  value       = local.enabled
}
