# Unit Tests for tf-atom-vpc-endpoint-aws
#
# These tests use a mock provider — no real AWS calls are made.
# All assertions are on plan-KNOWN values (label id, enabled flag,
# resource count) — never on computed arn/id, which are unknown under
# a mock provider.
#
# Run with:      terraform test -test-directory=tests/unit
# Run verbose:   terraform test -test-directory=tests/unit -verbose

mock_provider "aws" {}

variables {
  # tf-label identity
  namespace = "eg"
  stage     = "test"
  name      = "thing"

  # Module-specific required inputs
  vpc_id       = "vpc-0123456789abcdef0"
  service_name = "com.amazonaws.us-east-1.s3"

  # Optional inputs with valid sample values
  vpc_endpoint_type = "Interface"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "*"
      Resource  = "*"
    }]
  })
}

# ---------------------------------------------------------------------------
# Test: module creates the endpoint when enabled (default)
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = length(aws_vpc_endpoint.default) == 1
    error_message = "Expected exactly one aws_vpc_endpoint when enabled."
  }

  assert {
    condition     = output.enabled == true
    error_message = "enabled output should be true when the module is enabled."
  }

  assert {
    condition     = aws_vpc_endpoint.default[0].service_name == "com.amazonaws.us-east-1.s3"
    error_message = "service_name should be passed through to the resource."
  }
}

# ---------------------------------------------------------------------------
# Test: disabling the module creates no resources
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = length(aws_vpc_endpoint.default) == 0
    error_message = "Expected no aws_vpc_endpoint when enabled = false."
  }

  assert {
    condition     = output.id == ""
    error_message = "id output should be empty string when the module is disabled."
  }
}
