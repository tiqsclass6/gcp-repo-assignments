# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
# Italy Routers

resource "google_compute_router" "italy" {
  name    = "italy"
  region  = "europe-west8"
  network = google_compute_network.main.id
}
