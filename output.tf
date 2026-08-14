###################################################
# EKS Cluster
###################################################

output "eks_cluster_name" {

  description = "Name of the EKS cluster"

  value = module.eks.cluster_name

}


output "eks_cluster_arn" {

  description = "ARN of the EKS cluster"

  value = module.eks.cluster_arn

}


output "eks_cluster_endpoint" {

  description = "Private Kubernetes API endpoint"

  value = module.eks.cluster_endpoint

}


output "eks_node_group_name" {

  description = "Name of the EKS managed node group"

  value = module.eks.node_group_name

}


###################################################
# Network
###################################################

output "vpc_id" {

  description = "ID of the platform VPC"

  value = module.network.vpc_id

}


output "private_subnet_ids" {

  description = "Private subnet IDs"

  value = module.network.private_subnet_ids

}


output "public_subnet_ids" {

  description = "Public subnet IDs"

  value = module.network.public_subnet_ids

}


###################################################
# ECR
###################################################

output "backend_ecr_repository_url" {

  description = "Backend ECR repository URL"

  value = module.ecr.backend_repository_url

}


output "frontend_ecr_repository_url" {

  description = "Frontend ECR repository URL"

  value = module.ecr.frontend_repository_url

}


output "worker_ecr_repository_url" {

  description = "Worker ECR repository URL"

  value = module.ecr.worker_repository_url

}