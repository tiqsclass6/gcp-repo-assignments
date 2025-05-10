# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router

# Iowa Routers

resource "google_compute_router" "iowa-router1" {
  name    = "iowa-router1"
  region  = "us-central1"
  network = google_compute_network.main.id
}

resource "google_compute_router" "iowa-router2" {
  name    = "iowa-router2"
  region  = "us-central1"
  network = google_compute_network.prod.id
}

# Tokyo Routers

resource "google_compute_router" "tokyo-router1" {
  name    = "tokyo-router1"
  region  = "asia-southeast1"
  network = google_compute_network.main.id
}

resource "google_compute_router" "tokyo-router2" {
  name    = "tokyo-router2"
  region  = "asia-southeast1"
  network = google_compute_network.prod.id
}

# Brazil Routers

resource "google_compute_router" "brazil-router1" {
  name    = "brazil-router1"
  region  = "southamerica-east1"
  network = google_compute_network.main.id
}

resource "google_compute_router" "brazil-router2" {
  name    = "brazil-router2"
  region  = "southamerica-east1"
  network = google_compute_network.prod.id
}
