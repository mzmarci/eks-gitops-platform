###################################################
# Backend Repository
###################################################

output "backend_repository_url" {

  description = "ECR repository URL for the backend"

  value = aws_ecr_repository.backend.repository_url

}

###################################################
# Frontend Repository
###################################################

output "frontend_repository_url" {

  description = "ECR repository URL for the frontend"

  value = aws_ecr_repository.frontend.repository_url

}

###################################################
# Worker Repository
###################################################

output "worker_repository_url" {

  description = "ECR repository URL for the worker"

  value = aws_ecr_repository.worker.repository_url

}