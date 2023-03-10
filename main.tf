terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.50.0"
    }
  }
}

resource "google_compute_instance" "sui_instance" {
  count        = var.sui_instance_num

  name         = "sui-instance-${count.index}"
  machine_type = var.sui_machine_type
  tags         = ["open-ssh","open-sui"]

  metadata     = {
    ssh-keys = "root:${var.sui_instance_pubkey}"
    startup-script = <<-SCRIPT
    ${file("./templates/docker-script-build.tftpl")}
    ${file("./templates/execute-shell.tftpl")}
    SCRIPT
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      type  = "pd-standard"
      size  =  var.sui_disk_size              // 1000M * 1.024 * 200 = 200G
    }
  }

  network_interface {
    network = google_compute_network.sui_network.name
    access_config {
    }
  }
}

