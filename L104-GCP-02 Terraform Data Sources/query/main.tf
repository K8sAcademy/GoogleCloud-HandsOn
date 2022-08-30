terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.33.0"
    }
  }
}

provider "google" {
  credentials = file("../key.json") # the JSON key filename

  project = "" # the project name
  region  = "us-central1"
  zone    = "us-central1-c"
}

data "google_container_cluster" "my_cluster" {
  name = "myk8s"
  location = "us-central1-c"
}


