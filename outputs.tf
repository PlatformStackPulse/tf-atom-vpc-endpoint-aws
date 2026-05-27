output "enabled" {
  description = "Whether the module is enabled."
  value       = local.enabled
}

output "id" {
  description = "The ID of the VPC endpoint."
  value       = try(aws_vpc_endpoint.default[0].id, "")
}

output "arn" {
  description = "The ARN of the VPC endpoint."
  value       = try(aws_vpc_endpoint.default[0].arn, "")
}

output "dns_entry" {
  description = "DNS entries for the VPC endpoint."
  value       = try(aws_vpc_endpoint.default[0].dns_entry, [])
}

output "network_interface_ids" {
  description = "Network interface IDs for Interface endpoints."
  value       = try(aws_vpc_endpoint.default[0].network_interface_ids, [])
}

output "prefix_list_id" {
  description = "The prefix list ID for Gateway endpoints."
  value       = try(aws_vpc_endpoint.default[0].prefix_list_id, "")
}
