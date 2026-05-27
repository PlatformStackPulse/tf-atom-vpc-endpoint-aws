resource "aws_vpc_endpoint" "default" {
  count = local.enabled ? 1 : 0

  vpc_id            = var.vpc_id
  service_name      = var.service_name
  vpc_endpoint_type = var.vpc_endpoint_type
  auto_accept       = var.auto_accept
  policy            = var.policy
  tags              = module.this.tags

  # Interface endpoint options
  private_dns_enabled = var.vpc_endpoint_type == "Interface" ? var.private_dns_enabled : null
  security_group_ids  = var.vpc_endpoint_type == "Interface" ? var.security_group_ids : null
  subnet_ids          = var.vpc_endpoint_type == "Interface" ? var.subnet_ids : null

  # Gateway endpoint options
  route_table_ids = var.vpc_endpoint_type == "Gateway" ? var.route_table_ids : null
}
