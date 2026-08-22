###################################################
# Karpenter Node Assume Role Policy
###################################################

data "aws_iam_policy_document" "karpenter_node_assume_role" {

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
# Karpenter Node IAM Role
###################################################

resource "aws_iam_role" "karpenter_node" {

  name = "${local.prefix}-karpenter-node-role"

  assume_role_policy = data.aws_iam_policy_document.karpenter_node_assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-karpenter-node-role"
    }
  )

}


###################################################
# Karpenter Node Policy
###################################################

resource "aws_iam_role_policy_attachment" "karpenter_node_worker" {

  role = aws_iam_role.karpenter_node.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

}


###################################################
# Karpenter Node ECR Pull
###################################################

resource "aws_iam_role_policy_attachment" "karpenter_node_ecr" {

  role = aws_iam_role.karpenter_node.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"

}

###################################################
# Karpenter Node Instance Profile
###################################################

resource "aws_iam_instance_profile" "karpenter_node" {

  name = "${local.prefix}-karpenter-node-profile"

  role = aws_iam_role.karpenter_node.name

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-karpenter-node-profile"
    }
  )

}

###################################################
# Karpenter Controller Assume Role
###################################################

data "aws_iam_policy_document" "karpenter_controller_assume_role" {

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]

    principals {

      type = "Service"

      identifiers = [
        "pods.eks.amazonaws.com"
      ]

    }

  }

}

###################################################
# Karpenter Controller IAM Role
###################################################

resource "aws_iam_role" "karpenter_controller" {

  name = "${local.prefix}-karpenter-controller-role"

  assume_role_policy = data.aws_iam_policy_document.karpenter_controller_assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-karpenter-controller-role"
    }
  )

}

