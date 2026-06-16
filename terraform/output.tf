output "cluster_name" {

  value = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {

  value = aws_eks_cluster.eks.endpoint
}

output "frontend_ecr" {

  value = aws_ecr_repository.frontend.repository_url
}

output "backend_ecr" {

  value = aws_ecr_repository.backend.repository_url
}

output "ai_engine_ecr" {

  value = aws_ecr_repository.ai_engine.repository_url
}
