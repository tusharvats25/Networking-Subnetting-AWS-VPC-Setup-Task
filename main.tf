##############################################
# Local-only Terraform Simulation (No AWS)
##############################################

terraform {
  required_version = ">= 1.0"
}

# -----------------------
# VARIABLES
# -----------------------

variable "name_prefix" {
  type    = string
  default = "Tushar_Kumar"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

# -----------------------
# LOCAL VALUES
# -----------------------

locals {
  vpc_cidr = "10.0.0.0/16"

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]

  # Fake NAT EIP simulation (just static fake IP)
  simulated_nat_eip = "203.0.113.25"
}

# -----------------------
# OUTPUT TO LOCAL FILE
# -----------------------

resource "local_file" "vpc_description" {
  filename = "${path.module}/vpc.json"

  content = jsonencode({
    name_prefix       = var.name_prefix
    region            = var.aws_region
    vpc               = { cidr = local.vpc_cidr }
    public_subnets    = local.public_subnet_cidrs
    private_subnets   = local.private_subnet_cidrs
    nat_gateway_eip   = local.simulated_nat_eip
    note              = "This is a local Terraform simulation (no AWS used)."
  })
}

# -----------------------
# OUTPUTS
# -----------------------

output "vpc_file_created" {
  value = local_file.vpc_description.filename
}

output "vpc_cidr" {
  value = local.vpc_cidr
}

output "public_subnets" {
  value = local.public_subnet_cidrs
}

output "private_subnets" {
  value = local.private_subnet_cidrs
}
