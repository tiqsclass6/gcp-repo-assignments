# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

# Iowa VPC
resource "google_compute_network" "iowa" {
  name                            = "iowa"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

}

# Brazil VPC
resource "google_compute_network" "brazil" {
  name                            = "brazil"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

}

# Tokyo VPC
resource "google_compute_network" "tokyo" {
  name                            = "tokyo"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

}
