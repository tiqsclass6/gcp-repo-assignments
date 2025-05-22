resource "google_compute_instance" "iowa-vm" {
  name         = "iowa-vm"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.iowa-private1.name
    
    access_config {}
  }

  metadata_startup_script = file("./brazil-startup.sh")
}
