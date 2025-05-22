# Allow SSH (TCP:22)


resource "google_compute_firewall" "allow-ssh1" {
  name    = "allow-ssh1"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-ssh2" {
  name    = "allow-ssh2"
  network = google_compute_network.prod.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow HTTP-HTTPS (Web)

resource "google_compute_firewall" "allow-http1" {
  name    = "allow-http1"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  direction   = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-http2" {
  name    = "allow-web2"
  network = google_compute_network.prod.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow ICMP (Ping)

resource "google_compute_firewall" "allow-icmp1" {
  name    = "allow-icmp1"
  network = google_compute_network.main.name

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-icmp2" {
  name    = "allow-icmp2"
  network = google_compute_network.prod.name

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow RDP (TCP:3389)

resource "google_compute_firewall" "allow-rdp1" {
  name    = "allow-rdp1"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-rdp2" {
  name    = "allow-rdp2"
  network = google_compute_network.prod.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Allow Database (MySQL and Oracle DB)

resource "google_compute_firewall" "allow-db1" {
  name    = "allow-db1"
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

resource "google_compute_firewall" "allow-db2" {
  name    = "allow-db2"
  network = google_compute_network.prod.name

  allow {
    protocol = "tcp"
    ports = [
      "3306", # MySQL
      "1521"  # Oracle DB
    ]
  }

  source_ranges = ["0.0.0.0/0"]
}
