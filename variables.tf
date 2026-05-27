# -----------------------------------------------------------------------------
# Module-Specific Variables
# -----------------------------------------------------------------------------

variable "vpc_id" {
  type        = string
  description = "The VPC ID in which to create the endpoint."
}

variable "service_name" {
  type        = string
  description = "The AWS service name (e.g. com.amazonaws.us-east-1.s3)."
}

variable "vpc_endpoint_type" {
  type        = string
  description = "Type of VPC endpoint. Valid values: Gateway, Interface, GatewayLoadBalancer."
  default     = "Interface"
  validation {
    condition     = contains(["Gateway", "Interface", "GatewayLoadBalancer"], var.vpc_endpoint_type)
    error_message = "Must be Gateway, Interface, or GatewayLoadBalancer."
  }
}

variable "auto_accept" {
  type        = bool
  description = "Whether to auto-accept the VPC endpoint connection."
  default     = null
}

variable "policy" {
  type        = string
  description = "IAM policy document for the endpoint."
  default     = null
}

variable "private_dns_enabled" {
  type        = bool
  description = "Whether to enable private DNS for Interface endpoints."
  default     = true
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs for Interface endpoints."
  default     = []
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for Interface endpoints."
  default     = []
}

variable "route_table_ids" {
  type        = list(string)
  description = "Route table IDs for Gateway endpoints."
  default     = []
}
