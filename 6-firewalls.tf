# Allow SSH (TCP:22)

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow HTTP-HTTPS (Web)

resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  direction   = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

# Allow ICMP (Ping)

resource "google_compute_firewall" "allow-icmp" {
  name    = "allow-icmp"
  network = google_compute_network.main.name

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow RDP (TCP:3389)

resource "google_compute_firewall" "allow-rdp" {
  name    = "allow-rdp"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow Database (MySQL and Oracle DB)

resource "google_compute_firewall" "allow-db" {
  name    = "allow-db"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports = [
      "3306", # MySQL
      "1521"  # Oracle DB
    ]
  }

  source_ranges = ["0.0.0.0/0"]
}
