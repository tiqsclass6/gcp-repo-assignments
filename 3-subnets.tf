# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

# Iowa Subnets

resource "google_compute_subnetwork" "iowa-private" {
  name                     = "iowa-private"
  ip_cidr_range            = "10.232.0.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

# Tokyo Subnets

resource "google_compute_subnetwork" "tokyo-private" {
  name                     = "tokyo-private"
  ip_cidr_range            = "10.233.0.0/24"
  region                   = "asia-southeast1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

# Brazil Subnets

resource "google_compute_subnetwork" "brazil-private" {
  name                     = "brazil-private"
  ip_cidr_range            = "10.234.0.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

# Italy Subnets

resource "google_compute_subnetwork" "italy-private" {
  name                     = "italy-private"
  ip_cidr_range            = "10.235.0.0/24"
  region                   = "europe-west8"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

# Regional Proxy-Only Subnet 
# Required for Regional Application Load Balancer for traffic offloading

resource "google_compute_subnetwork" "regional_proxy_subnet" {
  name          = "regional-proxy-subnet"
  region        = "europe-west8"
  ip_cidr_range = "10.235.50.0/24" # Used in Italy Network

  # This purpose reserves this subnet for regional Envoy-based load balancers
  purpose = "REGIONAL_MANAGED_PROXY"
  network = google_compute_network.main.id
  role    = "ACTIVE"
}
