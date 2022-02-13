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
  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "google" {
  project = var.project
  region  = var.region
}