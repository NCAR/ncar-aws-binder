module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.6.0"

  name = "binder-eks-vpc"
  cidr = "10.0.0.0/16"

  azs                  = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "List of IDs of private subnets"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "List of IDs of public subnets"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}

output "default_security_group_id" {

  value       = module.vpc.default_security_group_id
  description = "The ID of the security group created by default on VPC creation"

}


output "default_vpc_default_security_group_id" {
  value       = module.vpc.default_vpc_default_security_group_id
  description = "The ID of the security group created by default on VPC creation"
}
