###################################################
# EKS Cluster ID
###################################################

output "cluster_id" {

  description = "ID of the EKS cluster"

  value = aws_eks_cluster.olb.id

}

###################################################
# EKS Cluster Name
###################################################

output "cluster_name" {

  description = "Name of the EKS cluster"

  value = aws_eks_cluster.olb.name

}

###################################################
# EKS Cluster ARN
###################################################

output "cluster_arn" {

  description = "ARN of the EKS cluster"

  value = aws_eks_cluster.olb.arn

}

###################################################
# EKS Cluster Endpoint
###################################################

output "cluster_endpoint" {

  description = "Private Kubernetes API endpoint"

  value = aws_eks_cluster.olb.endpoint

}

###################################################
# Node Group Name
###################################################

output "node_group_name" {

  description = "Name of the EKS managed node group"

  value = aws_eks_node_group.olb_node.node_group_name

}