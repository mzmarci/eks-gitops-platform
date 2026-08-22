output "karpenter_controller_role_arn" {
  description = "IAM role ARN used by the Karpenter controller"

  value = aws_iam_role.karpenter_controller.arn
}


output "karpenter_node_role_arn" {
  description = "IAM role ARN used by Karpenter-provisioned nodes"

  value = aws_iam_role.karpenter_node.arn
}


output "karpenter_node_role_name" {
  description = "IAM role name used by Karpenter-provisioned nodes"

  value = aws_iam_role.karpenter_node.name
}


output "karpenter_node_instance_profile_name" {
  description = "Instance profile used by Karpenter-provisioned nodes"

  value = aws_iam_instance_profile.karpenter_node.name
}