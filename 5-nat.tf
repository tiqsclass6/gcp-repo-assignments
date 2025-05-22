# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address

# Iowa NAT

resource "google_compute_router_nat" "iowa-nat" {
  name   = "iowa-nat"
  router = google_compute_router.iowa-router1.name
  region = "us-central1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.iowa-private1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.iowa-nat.self_link]
}

resource "google_compute_address" "iowa-nat" {
  name         = "iowa-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "us-central1"
}

# Tokyo NAT

resource "google_compute_router_nat" "tokyo-nat" {
  name   = "tokyo-nat"
  router = google_compute_router.tokyo-router2.name
  region = "asia-southeast1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.tokyo-private2.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.tokyo-nat.self_link]
}

resource "google_compute_address" "tokyo-nat" {
  name         = "tokyo-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "asia-southeast1"
}

# Brazil NAT

resource "google_compute_router_nat" "brazil-nat" {
  name   = "brazil-nat"
  router = google_compute_router.brazil-router2.name
  region = "southamerica-east1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.brazil-private2.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.brazil-nat.self_link]
}

resource "google_compute_address" "brazil-nat" {
  name         = "brazil-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "southamerica-east1"
}
