# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address

# Iowa NAT

resource "google_compute_router_nat" "italy" {
  name   = "italy"
  router = google_compute_router.italy.name
  region = "europe-west8"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.italy-private.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.italy.self_link]
}

resource "google_compute_address" "italy" {
  name         = "italy"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "europe-west8"
}
