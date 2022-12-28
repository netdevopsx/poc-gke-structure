provider "google" {
  project = var.gcp.project_id
  region  = var.gcp.region
}

data "google_client_config" "provider" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}