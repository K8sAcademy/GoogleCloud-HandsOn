terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.33.0"
    }
  }
}

provider "google" {
  credentials = file("mylab.json") # the JSON key filename

  project = "mylab-359619" # the project name
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_container_cluster" "primary" {
  name               = "myk8s"
  location           = "us-central1-c"
  initial_node_count = 3
  node_config {
    machine_type = "n1-standard-1"
  }
}
