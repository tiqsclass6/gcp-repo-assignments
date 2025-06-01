# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones
# Datasource: Get a list of Google Compute zones that are UP in a region

data "google_compute_zones" "available" {
  status = "UP"
  #region = "" (optional if provider default is set)
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group (MIG)

# Italy MIG

resource "google_compute_region_instance_group_manager" "italy" {
  depends_on         = [google_compute_router_nat.italy]
  name               = "italy-mig"
  base_instance_name = "italy"
  region             = "europe-west8"

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names

  # Instance Template
  version {
    instance_template = google_compute_region_instance_template.italy.id
  }

  named_port {
    name = "webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.health-hc.id
    initial_delay_sec = 300
  }
}

/* Tokyo and Brazil MIG can be used interchangably from Italy if necessary
# Tokyo MIG

resource "google_compute_region_instance_group_manager" "tokyo" {
  depends_on         = [google_compute_router_nat.tokyo]
  name               = "tokyo-mig"
  base_instance_name = "tokyo"
  region             = "asia-southeast1"

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names

  # Instance Template
  version {
    instance_template = google_compute_region_instance_template.tokyo.id
  }

  named_port {
    name = "webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.health-hc.id
    initial_delay_sec = 300
  }
}

# Brazil MIG

resource "google_compute_region_instance_group_manager" "brazil" {
  depends_on         = [google_compute_router_nat.brazil]
  name               = "brazil-mig"
  base_instance_name = "brazil"
  region             = "southamerica-east1"

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names

  # Instance Template
  version {
    instance_template = google_compute_region_instance_template.brazil.id
  }

  named_port {
    name = "webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.health-hc.id
    initial_delay_sec = 300
  }
}
*/