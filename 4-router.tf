# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router

# Iowa Routers

resource "google_compute_router" "iowa1" {
  name    = "iowa1"
  region  = "us-central1"
  network = google_compute_network.main.id
}

resource "google_compute_router" "iowa2" {
  name    = "iowa2"
  region  = "us-central1"
  network = google_compute_network.prod.id
}

# Tokyo Routers

resource "google_compute_router" "tokyo1" {
  name    = "tokyo1"
  region  = "asia-southeast1"
  network = google_compute_network.main.id
}

resource "google_compute_router" "tokyo2" {
  name    = "tokyo2"
  region  = "asia-southeast1"
  network = google_compute_network.prod.id
}

# Brazil Routers

resource "google_compute_router" "brazil1" {
  name    = "brazil1"
  region  = "southamerica-east1"
  network = google_compute_network.main.id
}

resource "google_compute_router" "brazil2" {
  name    = "brazil2"
  region  = "southamerica-east1"
  network = google_compute_network.prod.id
}
