# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router

# Iowa Router

resource "google_compute_router" "iowa" {
  name    = "iowa"
  region  = "us-central1"
  network = google_compute_network.main.id
}

# Tokyo Router

resource "google_compute_router" "tokyo" {
  name    = "tokyo"
  region  = "asia-southeast1"
  network = google_compute_network.main.id
}

# Brazil Router

resource "google_compute_router" "brazil" {
  name    = "brazil"
  region  = "southamerica-east1"
  network = google_compute_network.main.id
}

# Italy Router

resource "google_compute_router" "italy" {
  name    = "italy"
  region  = "europe-west8"
  network = google_compute_network.main.id
}

