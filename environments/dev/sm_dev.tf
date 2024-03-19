### Dev secret manager secrets
# Put secret values to SSM parameter store
resource "google_secret_manager_secret" "dev-secrets" {
  for_each  = var.dev-secrets
  secret_id = each.key
  replication {
    user_managed {
      replicas {
        location = var.region
      }
      replicas {
        location = var.replica_region
      }
    }
  }
}
