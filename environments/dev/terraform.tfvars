
# GCP Settings
project_id = "proofofaction"
region  = "us-east4"
replica_region = "us-east1"
credentials = "proofofaction-0ef2bdaff6d9.json"
service_account = "secretmgr-hashproof-dev-sa@proofofaction.iam.gserviceaccount.com"
env_name = "dev"
# Bucket
bucket_name = "hashproof-tf-state"

tags = {
  env    = "dev"
  region = "us-east4"
  app    = "hashproof"
}

#GKE settings
cluster_name = "hashproof"
machine_type = "e2-standard-4"
min_count = 1
max_count = 3
disk_size_gb = 100
initial_node_count = 1
network_name = "hashproof-network"
subnet_name                    = "hashproof-subnet"
cluster_master_ip_cidr_range   = "10.100.100.0/28"
cluster_pods_ip_cidr_range     = "10.1.0.0/20"
cluster_services_ip_cidr_range = "10.10.11.0/24"

lb_ip = "35.234.153.55"

domain = "hashprooftest.com"

grafana_password = ""

#Postgres settings
devPostgresqlPassword = ""
stagePostgresqlPassword = ""


#Redis settings
devRedisPassword = ""
stageRedisPassword = ""


### Secrets
# Secrets dev
dev-secrets = {
  "dev-postgres-pass" = ""
  "dev-redis-pass"    = ""
}





