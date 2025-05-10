# Iowa Subnets

resource "google_compute_subnetwork" "iowa-private1" {
  name                     = "iowa-private1"
  ip_cidr_range            = "10.233.0.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "iowa-private2" {
  name                     = "iowa-private2"
  ip_cidr_range            = "10.235.0.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.prod.id
  private_ip_google_access = true
}

# Tokyo Subnets

resource "google_compute_subnetwork" "tokyo-private1" {
  name                     = "tokyo-private1"
  ip_cidr_range            = "10.233.60.0/24"
  region                   = "asia-southeast1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "tokyo-private2" {
  name                     = "tokyo-private2"
  ip_cidr_range            = "10.235.60.0/24"
  region                   = "asia-southeast1"
  network                  = google_compute_network.prod.id
  private_ip_google_access = true
}

# Brazil Subnets

resource "google_compute_subnetwork" "brazil-private1" {
  name                     = "brazil-private1"
  ip_cidr_range            = "10.233.120.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "brazil-private2" {
  name                     = "brazil-private2"
  ip_cidr_range            = "10.235.120.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.prod.id
  private_ip_google_access = true
}
