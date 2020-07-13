module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  cluster_version = "1.17"
  worker_groups = [
    {
      name                 = "${var.cluster_name}-worker-group"
      instance_type        = "t2.micro"
      asg_desired_capacity = 2
      asg_max_capacity     = 4
      asg_min_capacity     = 2
      tags = [{
        key                 = "app"
        propagate_at_launch = "true"
        value = "binder" },
      ]
    }
  ]

}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}


resource "random_string" "suffix" {
  length  = 8
  special = false
}


provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~>1.11"
}
