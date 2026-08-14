###################################################
# Network Module
###################################################

module "network" {

  source = "./terraform/module/network"

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  # public_subnet_cidrs = var.public_subnet_cidrs

  # private_subnet_cidrs = var.private_subnet_cidrs

  tags = var.tags

}


###################################################
# EKS Module
###################################################

module "eks" {

  source = "./terraform/module/eks"

  project_name = var.project_name

  environment = var.environment

  kubernetes_version = var.kubernetes_version

  private_subnet_ids = module.network.private_subnet_ids

  node_instance_types = var.node_instance_types

  desired_nodes = var.desired_nodes

  min_nodes = var.min_nodes

  max_nodes = var.max_nodes

  tags = var.tags

}

###################################################
# ECR Module
###################################################

module "ecr" {

  source = "./terraform/module/ecr"

  project_name = var.project_name

  environment = var.environment

  tags = var.tags

}