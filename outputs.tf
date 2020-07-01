output "region" {
  value       = var.region
  description = "AWS region"
}

output "cluster_name" {
  value       = var.eks_cluster_name
  description = "Kubernetes Cluster Name"
}
