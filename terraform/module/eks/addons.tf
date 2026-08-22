###################################################
# CoreDNS
###################################################

resource "aws_eks_addon" "coredns" {

  cluster_name = aws_eks_cluster.olb.name

  addon_name = "coredns"

}


###################################################
# kube-proxy
###################################################

resource "aws_eks_addon" "kube_proxy" {

  cluster_name = aws_eks_cluster.olb.name

  addon_name = "kube-proxy"

}


###################################################
# VPC CNI
###################################################

resource "aws_eks_addon" "vpc_cni" {

  cluster_name = aws_eks_cluster.olb.name

  addon_name = "vpc-cni"

}


###################################################
# EBS CSI Driver
###################################################

resource "aws_eks_addon" "ebs_csi" {

  cluster_name = aws_eks_cluster.olb.name

  addon_name = "aws-ebs-csi-driver"

}


## The Pod Identity Agent is what enables the EKS Pod Identity mechanism we'll use for AWS permissions from Kubernetes workloads.
###################################################
# EKS Pod Identity Agent
###################################################

resource "aws_eks_addon" "pod_identity_agent" {

  cluster_name = aws_eks_cluster.olb.name

  addon_name = "eks-pod-identity-agent"

}

