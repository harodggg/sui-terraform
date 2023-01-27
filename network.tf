
resource "google_compute_network" "sui_network" {
  name                    = "sui-network"
  auto_create_subnetworks = "true"

}

resource "google_compute_firewall" "sui_firewall" { 
  name                  = "sui-firewall"
  network               = google_compute_network.sui_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "8080", "1000-2000"]
  }

  target_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]


}