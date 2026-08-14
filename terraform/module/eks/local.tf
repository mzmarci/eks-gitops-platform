locals {

  prefix = "${var.project_name}-${var.environment}"

  cluster_name = "${local.prefix}-eks"

}