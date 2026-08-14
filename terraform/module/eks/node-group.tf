###################################################
# EKS Managed Node Group
###################################################

resource "aws_eks_node_group" "olb_node" {

  cluster_name = aws_eks_cluster.olb.name

  node_group_name = "${local.prefix}-node-group"

  node_role_arn = aws_iam_role.node.arn

  subnet_ids = var.private_subnet_ids

  instance_types = var.node_instance_types

  scaling_config {

    desired_size = var.desired_nodes

    min_size = var.min_nodes

    max_size = var.max_nodes

  }

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-node-group"
    }
  )

}