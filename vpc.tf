module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "2.6.0"

  name = "binder-eks-vpc"
  cidr = "192.168.0.0/16"

  azs                  = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
  private_subnets      = ["192.168.0.0/18", "192.168.64.0/18"]
  public_subnets       = ["192.168.128.0/18", "192.168.192.0/18"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }

}
