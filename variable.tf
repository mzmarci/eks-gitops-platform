###################################################
# Project Name
###################################################

variable "project_name" {

  description = "Name of the platform project"

  type = string

}


###################################################
# Environment
###################################################

variable "environment" {

  description = "Deployment environment"

  type = string

}


###################################################
# VPC CIDR
###################################################

variable "vpc_cidr" {

  description = "CIDR block for the platform VPC"

  type = string

}


###################################################
# Public Subnet CIDRs
###################################################

# variable "public_subnet_cidrs" {

#   description = "CIDR blocks for public subnets"

#   type = list(string)

# }


###################################################
# Private Subnet CIDRs
###################################################

# variable "private_subnet_cidrs" {

#   description = "CIDR blocks for private subnets"

#   type = list(string)

# }


###################################################
# Kubernetes Version
###################################################

variable "kubernetes_version" {

  description = "Kubernetes version for EKS"

  type = string

}


###################################################
# Node Instance Types
###################################################

variable "node_instance_types" {

  description = "EC2 instance types for EKS nodes"

  type = list(string)

  default = ["t3.medium"]

}


###################################################
# Desired Nodes
###################################################

variable "desired_nodes" {

  description = "Desired number of EKS nodes"

  type = number

  default = 2

}


###################################################
# Minimum Nodes
###################################################

variable "min_nodes" {

  description = "Minimum number of EKS nodes"

  type = number

  default = 2

}


###################################################
# Maximum Nodes
###################################################

variable "max_nodes" {

  description = "Maximum number of EKS nodes"

  type = number

  default = 4

}


###################################################
# Common Tags
###################################################

variable "tags" {

  description = "Common tags for platform resources"

  type = map(string)

  default = {}

}