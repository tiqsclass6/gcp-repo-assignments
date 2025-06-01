# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance

# Iowa VM

resource "google_compute_instance" "iowa" {
  name         = "iowa"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.iowa-private.name

    access_config {}
  }

  metadata_startup_script = file("./iowa.sh")
}

# Tokyo VM

resource "google_compute_instance" "tokyo" {
  name         = "tokyo"
  machine_type = "n2-standard-2"
  zone         = "asia-southeast1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.tokyo-private.name

    access_config {}
  }

  metadata_startup_script = file("./tokyo.sh")
}

# Brazil VM

resource "google_compute_instance" "brazil" {
  name         = "brazil"
  machine_type = "n2-standard-2"
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.brazil-private.name

    access_config {}
  }

  metadata_startup_script = file("./brazil.sh")
}