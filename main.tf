terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.50.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
  zone        = var.zone
}


resource "google_compute_network" "sui_network" {
  name                    = "sui-network"
  auto_create_subnetworks = "true"

}


resource "google_compute_instance" "sui_instance" {
  count        = 5

  name         = "sui-instance-${count.index}"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      type  = "pd-standard"
      size  = 1000 * 1.024                 // 1000M * 1.024 * 200 = 200G
    }
  }

  network_interface {
    network = google_compute_network.sui_network.name
    access_config {
    }
  }
}

