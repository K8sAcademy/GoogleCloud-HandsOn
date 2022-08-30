terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.33.0"
    }
  }
  cloud {
    organization = ""

    workspaces {
      name = "demo"
    }
  }
}

provider "google" {
  credentials = var.credentials

  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_container_cluster" "primary" {
  name               = "myk8s"
  location           = var.zone
  initial_node_count = 3
  node_config {
    machine_type = "n1-standard-1"
  }
}

data "google_container_cluster" "my_cluster" {
  name = "myk8s"
  location = "us-central1-c"
}