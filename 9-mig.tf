# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones
# Datasource: Get a list of Google Compute zones that are UP in a region
data "google_compute_zones" "iowa-available" {
  status = "UP"
  region = "us-central1"
}

data "google_compute_zones" "italy-available" {
  status = "UP"
  region = "europe-west8"
}

data "google_compute_zones" "brazil-available" {
  status = "UP"
  region = "southamerica-east1"
}

data "google_compute_zones" "tokyo-available" {
  status = "UP"
  region = "asia-northeast1"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group_manager
# Resource: Managed Instance Group (MIG)

# Iowa MIG

resource "google_compute_instance_group_manager" "iowa" {

  name = "iowa"
  zone = "us-central1-a"

  version {
    instance_template = google_compute_instance_template.iowa.id
    name              = "iowa"

  }

  base_instance_name = "iowa"
  target_size        = 2

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.health_hc.id
    initial_delay_sec = 60
  }
}

# Italy MIG

resource "google_compute_instance_group_manager" "italy" {

  name = "italy"
  zone = "europe-west8-b"

  version {
    instance_template = google_compute_instance_template.italy.id
    name              = "italy"

  }

  base_instance_name = "italy"
  target_size        = 2

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.health_hc.id
    initial_delay_sec = 60
  }
}

# Brazil MIG

resource "google_compute_instance_group_manager" "brazil" {

  name = "brazil"
  zone = "southamerica-east1-b"

  version {
    instance_template = google_compute_instance_template.brazil.id
    name              = "brazil"

  }

  base_instance_name = "brazil"
  target_size        = 2

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.health_hc.id
    initial_delay_sec = 60
  }
}

# Tokyo MIG

resource "google_compute_instance_group_manager" "tokyo" {

  name = "tokyo"
  zone = "asia-northeast1-a"

  version {
    instance_template = google_compute_instance_template.tokyo.id
    name              = "tokyo"

  }

  base_instance_name = "tokyo"
  target_size        = 2

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.health_hc.id
    initial_delay_sec = 60
  }
}
