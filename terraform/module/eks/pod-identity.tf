# Now we're explicitly saying: When the ebs-csi-controller-sa ServiceAccount in the kube-system namespace needs AWS permissions, associate it with our EBS CSI IAM role.


###################################################
# EBS CSI Pod Identity Association
###################################################

resource "aws_eks_pod_identity_association" "ebs_csi" {

  cluster_name = aws_eks_cluster.olb.name

  namespace = "kube-system"

  service_account = "ebs-csi-controller-sa"

  role_arn = aws_iam_role.ebs_csi.arn

}

###################################################
# VPC CNI Pod Identity
###################################################

resource "aws_eks_pod_identity_association" "vpc_cni" {

  cluster_name = aws_eks_cluster.olb.name

  namespace = "kube-system"

  service_account = "aws-node"

  role_arn = aws_iam_role.vpc_cni.arn

}
