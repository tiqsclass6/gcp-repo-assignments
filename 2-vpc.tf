# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

# Main VPC

resource "google_compute_network" "main" {
  name                    = "main"
  auto_create_subnetworks = false
}
