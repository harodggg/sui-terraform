
resource "google_compute_network" "sui_network" {
  name                    = "sui-network"
  auto_create_subnetworks = "true"

}

resource "google_compute_firewall" "ssh_firewall" { 
  name                  = "ssh-firewall"
  network               = google_compute_network.sui_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["open-ssh"]
  source_ranges = ["0.0.0.0/0"]


}


resource "google_compute_firewall" "sui_firewall" { 
  name                  = "sui-firewall"
  network               = google_compute_network.sui_network.name

  allow {
    protocol = "tcp"
    ports    = []
  }

  target_tags = ["open-sui"]
  source_ranges = ["0.0.0.0/0"]


}