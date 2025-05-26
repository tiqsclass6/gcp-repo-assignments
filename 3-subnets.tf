# Italy Subnets

resource "google_compute_subnetwork" "italy-private" {
  name                     = "italy-private"
  ip_cidr_range            = "10.233.0.0/24"
  region                   = "europe-west8"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

# Tokyo Subnets

resource "google_compute_subnetwork" "tokyo-private" {
  name                     = "tokyo-private"
  ip_cidr_range            = "10.233.20.0/24"
  region                   = "asia-southeast1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

# Brazil Subnets

resource "google_compute_subnetwork" "brazil-private" {
  name                     = "brazil-private"
  ip_cidr_range            = "10.233.40.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}
