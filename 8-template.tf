# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_template
# https://developer.hashicorp.com/terraform/language/functions/file
# Google Compute Engine: Regional Instance Template

# Iowa Instance Template

resource "google_compute_instance_template" "iowa" {
  name         = "iowa"
  description  = "Iowa Instance Template"
  machine_type = "e2-medium"
  region       = "us-central1"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.iowa.id
    access_config {}
  }

  tags = ["web", "ssh", "iowa"]

  metadata_startup_script = file("./SC1-iowa.sh")
}

# Italy Instance Template

resource "google_compute_instance_template" "italy" {
  name         = "italy"
  description  = "Italy Instance Template"
  machine_type = "e2-medium"
  region       = "europe-west8"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.italy.id
    access_config {}
  }

  tags = ["web", "ssh", "italy"]

  metadata_startup_script = file("./SC2-italy.sh")
}

# Brazil Instance Template

resource "google_compute_instance_template" "brazil" {
  name         = "brazil"
  description  = "Brazil Instance Template"
  machine_type = "e2-medium"
  region       = "southamerica-east1"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.brazil.id
    access_config {}
  }

  tags = ["web", "ssh", "brazil"]

  metadata_startup_script = file("./SC3-brazil.sh")
}

# Tokyo Instance Template

resource "google_compute_instance_template" "tokyo" {
  name         = "tokyo"
  description  = "Tokyo Instance Template"
  machine_type = "e2-medium"
  region       = "asia-northeast1"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.tokyo.id
    access_config {}
  }

  tags = ["web", "ssh", "tokyo"]

  metadata_startup_script = file("./SC4-tokyo.sh")
}
