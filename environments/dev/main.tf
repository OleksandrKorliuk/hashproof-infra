module "infrastructure" {
  source = "../../modules/infrastructure"

  service_account = var.service_account
  credentials = var.credentials

  project_id = var.project_id
  region = var.region
  zones = ["${var.region}-a", "${var.region}-b", "${var.region}-c"]
  cluster_name = var.cluster_name
  env_name = var.env_name
  min_count = var.min_count
  max_count = var.max_count
  disk_size_gb = var.disk_size_gb
  machine_type = var.machine_type
  initial_node_count = var.initial_node_count


  cluster_master_ip_cidr_range   =  var.cluster_master_ip_cidr_range
  cluster_pods_ip_cidr_range     = var.cluster_pods_ip_cidr_range
  cluster_services_ip_cidr_range = var.cluster_services_ip_cidr_range

  tags = var.tags
}
