# Autoscaler for Iowa

resource "google_compute_autoscaler" "iowa" {
  name   = "iowa-autoscaler"
  target = google_compute_instance_group_manager.iowa.id
  zone   = "us-central1-a"

  autoscaling_policy {
    max_replicas    = 4
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.1
    }
  }
}

# Autoscaler for Italy
resource "google_compute_autoscaler" "italy" {
  name   = "italy-autoscaler"
  target = google_compute_instance_group_manager.italy.id
  zone   = "europe-west8-b"

  autoscaling_policy {
    max_replicas    = 4
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.1
    }
  }
}

# Autoscaler for Brazil
resource "google_compute_autoscaler" "brazil" {
  name   = "brazil-autoscaler"
  target = google_compute_instance_group_manager.brazil.id
  zone   = "southamerica-east1-b"

  autoscaling_policy {
    max_replicas    = 4
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.1
    }
  }
}

# Autoscaler for Tokyo
resource "google_compute_autoscaler" "tokyo" {
  name   = "tokyo-autoscaler"
  target = google_compute_instance_group_manager.tokyo.id
  zone   = "asia-northeast1-a"

  autoscaling_policy {
    max_replicas    = 4
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.1
    }
  }
}
