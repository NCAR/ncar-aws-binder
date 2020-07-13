
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
output "cluster_role" {
  value = data.aws_iam_role.eks_cluster_role
}

output "node_instance_role" {
  value = data.aws_iam_role.node_instance_role
}

output "endpoint" {
  value = aws_eks_cluster.binder.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.binder.certificate_authority.0.data
}
