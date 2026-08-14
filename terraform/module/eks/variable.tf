variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs used by EKS"
  type        = list(string)
}

variable "tags" {
  description = "Tags applied to EKS resources"
  type        = map(string)
  default     = {}
}

###################################################
# Node Instance Types
###################################################

variable "node_instance_types" {

  description = "EC2 instance types used by the EKS node group"

  type = list(string)

  default = ["t3.medium"]

}


###################################################
# Desired Nodes
###################################################

variable "desired_nodes" {

  description = "Desired number of EKS worker nodes"

  type = number

  default = 2

}


###################################################
# Minimum Nodes
###################################################

variable "min_nodes" {

  description = "Minimum number of EKS worker nodes"

  type = number

  default = 2

}


###################################################
# Maximum Nodes
###################################################

variable "max_nodes" {

  description = "Maximum number of EKS worker nodes"

  type = number

  default = 4

}