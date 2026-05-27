resource "aws_vpc_endpoint" "this" {
  count = local.enabled ? 1 : 0

  vpc_id              = var.vpc_id
  service_name        = var.service_name
  vpc_endpoint_type   = var.vpc_endpoint_type
  auto_accept         = var.auto_accept
  private_dns_enabled = var.vpc_endpoint_type == "Interface" ? var.private_dns_enabled : null
  policy              = var.policy

  # Interface endpoint settings
  subnet_ids         = var.vpc_endpoint_type == "Interface" ? var.subnet_ids : null
  security_group_ids = var.vpc_endpoint_type == "Interface" ? var.security_group_ids : null

  # Gateway endpoint settings
  route_table_ids = var.vpc_endpoint_type == "Gateway" ? var.route_table_ids : null

  tags = module.this.tags
}
