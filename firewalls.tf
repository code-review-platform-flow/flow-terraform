# Google Compute Firewall 설정
resource "google_compute_firewall" "allow-ssh" {
  name = var.ssh_firewall_name
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = var.firewall_source_ranges
}

resource "google_compute_firewall" "allow-http-https" {
  name = var.http_https_firewall_name
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports = ["80", "443"]
  }

  source_ranges = var.firewall_source_ranges
}