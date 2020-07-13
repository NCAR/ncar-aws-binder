
// Retrieve Created Roles. To be used later
data "aws_iam_role" "eks_cluster_role" {
  name = "eksClusterRole"
}

data "aws_iam_role" "node_instance_role" {
  name = "NodeInstanceRole"
}

resource "aws_eks_cluster" "binder" {
  name     = var.cluster_name
  role_arn = data.aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = concat(module.vpc.private_subnets, module.vpc.public_subnets)
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~>1.10"
}
