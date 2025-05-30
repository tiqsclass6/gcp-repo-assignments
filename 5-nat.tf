# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address

# Iowa NAT

resource "google_compute_router_nat" "iowa" {
  name   = "iowa"
  router = google_compute_router.iowa1.name
  region = "us-central1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.iowa-private1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.iowa.self_link]
}

resource "google_compute_address" "iowa" {
  name         = "iowa"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "us-central1"
}

# Tokyo NAT

resource "google_compute_router_nat" "tokyo" {
  name   = "tokyo"
  router = google_compute_router.tokyo2.name
  region = "asia-southeast1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.tokyo-private2.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.tokyo.self_link]
}

resource "google_compute_address" "tokyo" {
  name         = "tokyo"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "asia-southeast1"
}

# Brazil NAT

resource "google_compute_router_nat" "brazil" {
  name   = "brazil"
  router = google_compute_router.brazil2.name
  region = "southamerica-east1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.brazil-private2.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.brazil.self_link]
}

resource "google_compute_address" "brazil" {
  name         = "brazil"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "southamerica-east1"
}
