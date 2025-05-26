# Italy VM

resource "google_compute_instance" "italy1" {
  name         = "italy1"
  machine_type = "n2-standard-2"
  zone         = "europe-west8-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.italy-private.name

    access_config {}
  }

  metadata_startup_script = file("./italy-startup.sh")
}

# Tokyo VM

resource "google_compute_instance" "tokyo1" {
  name         = "tokyo1"
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

  metadata_startup_script = file("./japan-startup.sh")
}

# Brazil VM

resource "google_compute_instance" "brazil1" {
  name         = "brazil1"
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

  metadata_startup_script = file("./brazil-startup.sh")
}
