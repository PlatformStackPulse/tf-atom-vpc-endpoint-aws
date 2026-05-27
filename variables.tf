variable "vpc_id" {
  type        = string
  description = "ID of the VPC in which to create the endpoint."
}

variable "service_name" {
  type        = string
  description = "The service name for the VPC endpoint (e.g., com.amazonaws.us-east-1.s3)."
}

variable "vpc_endpoint_type" {
  type        = string
  description = "Type of VPC endpoint. Valid values: Interface, Gateway, GatewayLoadBalancer."
  default     = "Interface"
  validation {
    condition     = contains(["Interface", "Gateway", "GatewayLoadBalancer"], var.vpc_endpoint_type)
    error_message = "VPC endpoint type must be Interface, Gateway, or GatewayLoadBalancer."
  }
}

variable "auto_accept" {
  type        = bool
  description = "Whether to automatically accept the VPC endpoint connection."
  default     = null
}

variable "private_dns_enabled" {
  type        = bool
  description = "Whether to enable private DNS for Interface endpoints."
  default     = true
}

variable "policy" {
  type        = string
  description = "IAM policy document for the VPC endpoint. JSON string."
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for Interface endpoints."
  default     = []
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs for Interface endpoints."
  default     = []
}

variable "route_table_ids" {
  type        = list(string)
  description = "Route table IDs for Gateway endpoints."
  default     = []
}
