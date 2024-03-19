output "kubernetes_cluster_name" {
  value       = module.infrastructure.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_endpoint" {
  sensitive   = true
  value       = module.infrastructure.endpoint
  description = "GKE endpoint"
}
output "kubernetes_cluster_ca_certificate" {
  sensitive   = true
  value       = module.infrastructure.ca_certificate
  description = "GKE ca_certificate"
}
