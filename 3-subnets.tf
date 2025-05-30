# Iowa Subnets

resource "google_compute_subnetwork" "iowa1" {
  name                     = "iowa1"
  ip_cidr_range            = "10.233.0.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "iowa2" {
  name                     = "iowa2"
  ip_cidr_range            = "10.235.0.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.prod.id
  private_ip_google_access = true
}

# Tokyo Subnets

resource "google_compute_subnetwork" "tokyo1" {
  name                     = "tokyo1"
  ip_cidr_range            = "10.233.60.0/24"
  region                   = "asia-southeast1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "tokyo2" {
  name                     = "tokyo2"
  ip_cidr_range            = "10.235.60.0/24"
  region                   = "asia-southeast1"
  network                  = google_compute_network.prod.id
  private_ip_google_access = true
}

# Brazil Subnets

resource "google_compute_subnetwork" "brazil1" {
  name                     = "brazil1"
  ip_cidr_range            = "10.233.120.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "brazil2" {
  name                     = "brazil2"
  ip_cidr_range            = "10.235.120.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.prod.id
  private_ip_google_access = true
}
