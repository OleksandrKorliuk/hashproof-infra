variable "credentials" {
  type        = string
  description = "Location of the credential keyfile."
}

variable "project_id" {
  type        = string
  description = "The project ID to create the cluster."
}

variable "region" {
  type        = string
  description = "The region to create the cluster."
}
variable "replica_region" {
  type        = string
  description = "The replica region to create the cluster."
}

variable "machine_type" {
  type        = string
  description = "Type of the node compute engines."
}

variable "min_count" {
  type        = number
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
}

variable "max_count" {
  type        = number
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
}

variable "disk_size_gb" {
  type        = number
  description = "Size of the node's disk."
}

variable "service_account" {
  type        = string
  description = "The service account to run nodes as if not overridden in `node_pools`. The create_service_account variable default value (true) will cause a cluster-specific service account to be created."
}

variable "initial_node_count" {
  type        = number
  description = "The number of nodes to create in this cluster's default node pool."
}

variable "cluster_name" {
  description = "Cluster name"
  type = string
}

variable "env_name" {
  description = "Env name"
  type = string
}

variable "network_name" {
  type        = string
  description = "The name of the network."
}
variable "subnet_name" {
  type        = string
  description = "The name of the subnet."
}
variable "cluster_master_ip_cidr_range" {
  type        = string
  description = "cluster_master_ip_cidr_range"
  default = "10.100.100.0/28"
}

variable "cluster_pods_ip_cidr_range" {
  type        = string
  description = "cluster_pods_ip_cidr_range"
  default = "10.101.0.0/16"
}
variable "cluster_services_ip_cidr_range" {
  type        = string
  description = "cluster_services_ip_cidr_range"
  default = "10.102.0.0/16"
}
variable "lb_ip" {
  type        = string
  description = "Load balancer IP"
  default = ""
}

variable "domain" {
  default     = ""
  description = "Domain name"
}
variable "grafana_password" {
  default     = ""
  description = "grafana_password"
}


### Secrets

# Secrets dev
variable "dev-secrets" {
  type    = map(any)
  default = {}
}
variable "stage-secrets" {
  type    = map(any)
  default = {}
}


variable "tags" {
  description = "Tags for services"
  default     = {
    "env" : "dev"
  }
}
variable "devPostgresqlPassword" {
  description = ""
  default     = ""
}
variable "devRedisPassword" {
  description = ""
  default     = ""
}
variable "stagePostgresqlPassword" {
  description = ""
  default     = ""
}
variable "stageRedisPassword" {
  description = ""
  default     = ""
}
