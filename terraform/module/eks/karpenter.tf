###################################################
# Karpenter Pod Identity Association
###################################################

resource "aws_eks_pod_identity_association" "karpenter" {

  cluster_name = aws_eks_cluster.olb.name

  namespace = "kube-system"

  service_account = "karpenter"

  role_arn = var.karpenter_controller_role_arn

}

resource "aws_iam_role_policy_attachment" "karpenter_node_cni" {

  role = aws_iam_role.karpenter_node.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

}