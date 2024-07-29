# Google Compute Firewall 설정
resource "google_compute_firewall" "allow-ssh" {
  name = var.firewall_name
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = var.firewall_source_ranges
}