# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_template
# https://developer.hashicorp.com/terraform/language/functions/file
# Google Compute Engine: Regional Instance Template

# Italy Instance Template

resource "google_compute_region_instance_template" "italy" {
  name         = "italy"
  description  = "Italy Instance Template"
  machine_type = "e2-medium"
  region       = "europe-west8"

  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.italy-private.id

    access_config {
      # Include this section to give the VM an external IP address
    }

  }

  # Install Webserver using file() function
  metadata_startup_script = file("./italy.sh")
}

/*
# Tokyo Instance Template

resource "google_compute_region_instance_template" "tokyo" {
  name         = "tokyo"
  description  = "Tokyo Instance Template"
  machine_type = "e2-medium"
  region       = "asia-southeast1"

  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.tokyo-private.id

    access_config {
      # Include this section to give the VM an external IP address
    }

  }

  # Install Webserver using file() function
  metadata_startup_script = file("./tokyo-startup.sh")
}

# Brazil Instance Template

resource "google_compute_region_instance_template" "brazil" {
  name         = "brazil"
  description  = "Brazil Instance Template"
  machine_type = "e2-medium"
  region       = "southamerica-east1"

  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.brazil-private.id

    access_config {
      # Include this section to give the VM an external IP address
    }

  }

  # Install Webserver using file() function
  metadata_startup_script = file("./brazil-startup.sh")
}
*/