###################################################
# Backend Repository
###################################################

resource "aws_ecr_repository" "backend" {

  name = "${local.prefix}-backend"

  image_tag_mutability = "IMMUTABLE"

  force_delete = true

  encryption_configuration {
  encryption_type = "AES256"
}

  image_scanning_configuration {

    scan_on_push = true

  }

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-backend"
    }
  )

}


###################################################
# Frontend Repository
###################################################

resource "aws_ecr_repository" "frontend" {

  name = "${local.prefix}-frontend"

  image_tag_mutability = "IMMUTABLE"

  force_delete = true

  encryption_configuration {
  encryption_type = "AES256"
}

  image_scanning_configuration {

    scan_on_push = true

  }

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-frontend"
    }
  )

}


###################################################
# Worker Repository
###################################################

resource "aws_ecr_repository" "worker" {

  name = "${local.prefix}-worker"

  image_tag_mutability = "IMMUTABLE"

  force_delete = true

  encryption_configuration {
  encryption_type = "AES256"
}

  image_scanning_configuration {

    scan_on_push = true

  }

  tags = merge(
    var.tags,
    {
      Name = "${local.prefix}-worker"
    }
  )

}