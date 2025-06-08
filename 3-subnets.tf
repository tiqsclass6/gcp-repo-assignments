# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

# Iowa Subnet
resource "google_compute_subnetwork" "iowa" {
  name                     = "iowa"
  ip_cidr_range            = "10.232.0.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
  depends_on               = [google_compute_network.main]
}

# Italy Subnet
resource "google_compute_subnetwork" "italy" {
  name                     = "italy"
  ip_cidr_range            = "10.233.0.0/24"
  region                   = "europe-west8"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
  depends_on               = [google_compute_network.main]
}

# Brazil Subnet
resource "google_compute_subnetwork" "brazil" {
  name                     = "brazil"
  ip_cidr_range            = "10.234.0.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
  depends_on               = [google_compute_network.main]
}

# Tokyo Subnet
resource "google_compute_subnetwork" "tokyo" {
  name                     = "tokyo"
  ip_cidr_range            = "10.235.0.0/24"
  region                   = "asia-northeast1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
  depends_on               = [google_compute_network.main]
}