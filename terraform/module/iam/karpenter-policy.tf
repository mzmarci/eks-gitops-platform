###################################################
# Karpenter Controller Policy
###################################################

resource "aws_iam_policy" "karpenter_controller" {

  name = "${local.prefix}-karpenter-controller-policy"

  description = "Permissions for the Karpenter controller"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      ###################################################
      # EC2 Lifecycle
      ###################################################

      {
        Sid    = "EC2Lifecycle"
        Effect = "Allow"

        Action = [
          "ec2:CreateFleet",
          "ec2:CreateLaunchTemplate",
          "ec2:CreateTags",
          "ec2:DeleteLaunchTemplate",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeImages",
          "ec2:DescribeInstanceTypeOfferings",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeInstances",
          "ec2:DescribeLaunchTemplates",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSpotPriceHistory",
          "ec2:DescribeSubnets",
          "ec2:DescribeVolumes",
          "ec2:RunInstances",
          "ec2:TerminateInstances"
        ]

        Resource = "*"
      },

      ###################################################
      # IAM Instance Profile
      ###################################################

      {
        Sid    = "IAMInstanceProfile"
        Effect = "Allow"

        Action = [
          "iam:AddRoleToInstanceProfile",
          "iam:CreateInstanceProfile",
          "iam:DeleteInstanceProfile",
          "iam:GetInstanceProfile",
          "iam:RemoveRoleFromInstanceProfile",
          "iam:TagInstanceProfile"
        ]

        Resource = "*"
      },

      ###################################################
      # Pass Karpenter Node Role
      ###################################################

      {
        Sid    = "PassKarpenterNodeRole"
        Effect = "Allow"

        Action = [
          "iam:PassRole"
        ]

        Resource = aws_iam_role.karpenter_node.arn

        Condition = {
          StringEquals = {
            "iam:PassedToService" = "ec2.amazonaws.com"
          }
        }
      },

      ###################################################
      # EKS Discovery
      ###################################################

      {
        Sid    = "EKSDiscovery"
        Effect = "Allow"

        Action = [
          "eks:DescribeCluster"
        ]

        Resource = "*"
      },

      ###################################################
      # SSM Parameter Discovery
      ###################################################

      {
        Sid    = "SSMDiscovery"
        Effect = "Allow"

        Action = [
          "ssm:GetParameter"
        ]

        Resource = "*"
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-karpenter-controller-policy"
    }
  )
}


###################################################
# Attach Policy to Karpenter Controller
###################################################

resource "aws_iam_role_policy_attachment" "karpenter_controller" {

  role = aws_iam_role.karpenter_controller.name

  policy_arn = aws_iam_policy.karpenter_controller.arn

}