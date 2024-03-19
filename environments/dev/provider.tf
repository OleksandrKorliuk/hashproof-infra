provider "google" {
  credentials = file(var.credentials)
  project     = var.project_id
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket      = "hashproof-tf-state"
    prefix      = "dev"
    credentials = "proofofaction-0ef2bdaff6d9.json"
  }
}

data "google_client_config" "provider" {}

provider "kubernetes" {
  host  = "https://${module.infrastructure.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(module.infrastructure.ca_certificate)
}

provider "helm" {
    kubernetes {
      host  =  "https://${module.infrastructure.endpoint}"
      token = data.google_client_config.provider.access_token
      cluster_ca_certificate = base64decode(module.infrastructure.ca_certificate)
    }
}

