# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

# Main VPC

resource "google_compute_network" "main" {
  name                            = "main"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

}

# Production VPC

resource "google_compute_network" "prod" {
  name                            = "prod"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

}
