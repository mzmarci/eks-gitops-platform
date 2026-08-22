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
# EKS Cluster Security Group
###################################################

output "cluster_security_group_id" {

  description = "Security group associated with the EKS cluster"

  value = aws_eks_cluster.olb.vpc_config[0].cluster_security_group_id

}


###################################################
# EKS Node Group Name
###################################################

output "node_group_name" {

  description = "Name of the EKS managed node group"

  value = aws_eks_node_group.olb_node.node_group_name

}


###################################################
# EKS Node IAM Role ARN
###################################################

output "node_role_arn" {

  description = "IAM role ARN used by EKS worker nodes"

  value = aws_iam_role.node.arn

}

###################################################
# EBS CSI IAM Role
###################################################

output "ebs_csi_role_arn" {

  description = "IAM role ARN used by the EBS CSI Driver"

  value = aws_iam_role.ebs_csi.arn

}


###################################################
# VPC CNI IAM Role
###################################################

output "vpc_cni_role_arn" {

  description = "IAM role ARN used by the VPC CNI"

  value = aws_iam_role.vpc_cni.arn

}

output "node_role_name" {

  description = "IAM role name used by EKS worker nodes"

  value = aws_iam_role.node.name

}