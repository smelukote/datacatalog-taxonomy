terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.10.0"
    }

  }
}

#Provider used to make taxonomys
provider "google-beta" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}