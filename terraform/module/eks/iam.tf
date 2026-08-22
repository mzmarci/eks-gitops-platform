###################################################
# EKS Cluster Assume Role Policy
###################################################

data "aws_iam_policy_document" "cluster_assume_role" {

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {

      type = "Service"

      identifiers = [
        "eks.amazonaws.com"
      ]

    }

  }

}

###################################################
# EKS Cluster IAM Role
###################################################

resource "aws_iam_role" "cluster" {

  name = "${local.prefix}-eks-cluster-role"

  assume_role_policy = data.aws_iam_policy_document.cluster_assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-eks-cluster-role"
    }
  )

}

###################################################
# EKS Cluster Policy
###################################################

resource "aws_iam_role_policy_attachment" "cluster" {

  role = aws_iam_role.cluster.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

}


###################################################
# EKS Node Assume Role Policy
###################################################

data "aws_iam_policy_document" "node_assume_role" {

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {

      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]

    }

  }

}

###################################################
# EKS Node IAM Role
###################################################

resource "aws_iam_role" "node" {

  name = "${local.prefix}-eks-node-role"

  assume_role_policy = data.aws_iam_policy_document.node_assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-eks-node-role"
    }
  )

}


###################################################
# EKS Worker Node Policy
###################################################

resource "aws_iam_role_policy_attachment" "node_worker" {

  role = aws_iam_role.node.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

}


###################################################
# ECR Pull Policy
###################################################

resource "aws_iam_role_policy_attachment" "node_ecr" {

  role = aws_iam_role.node.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"

}

###################################################
# EBS CSI Driver IAM Role
###################################################

resource "aws_iam_role" "ebs_csi" {

  name = "${local.prefix}-ebs-csi-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Principal = {
          Service = "pods.eks.amazonaws.com"
        }

        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }

    ]

  })

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-ebs-csi-role"
    }
  )

}

###################################################
# EBS CSI Driver Policy
###################################################

resource "aws_iam_role_policy_attachment" "ebs_csi" {

  role = aws_iam_role.ebs_csi.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"

}

###################################################
# VPC CNI IAM Role
###################################################

resource "aws_iam_role" "vpc_cni" {

  name = "${local.prefix}-vpc-cni-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "pods.eks.amazonaws.com"

        }

        Action = [

          "sts:AssumeRole",

          "sts:TagSession"

        ]

      }

    ]

  })

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-vpc-cni-role"
    }
  )

}


###################################################
# VPC CNI Policy
###################################################

resource "aws_iam_role_policy_attachment" "vpc_cni" {

  role = aws_iam_role.vpc_cni.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

}