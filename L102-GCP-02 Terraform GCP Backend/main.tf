terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.33.0"
    }
  }
  backend "gcs" {
    bucket  = ""  # your bucket name
    prefix  = "tfstate"
    credentials = "key.json" # the JSON key filename
  }
}

provider "google" {
  credentials = file("key.json") # the JSON key filename

  project = "" # the project name
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-lab"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

}
