resource "aws_eks_cluster" "olb" {

  name     = local.cluster_name
  version  = var.kubernetes_version
  role_arn = aws_iam_role.cluster.arn

  vpc_config {

    subnet_ids = var.private_subnet_ids

    endpoint_private_access = true
    endpoint_public_access  = false

  }

}