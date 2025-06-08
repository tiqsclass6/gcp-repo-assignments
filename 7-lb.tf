# Global External HTTP Load Balancer Configuration

# 1. Global Forwarding Rule
resource "google_compute_global_forwarding_rule" "entry_point" {
  name                  = "tsa-gateway"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "80"
  target                = google_compute_target_http_proxy.tsa_http_proxy.id

  depends_on = [
    google_compute_subnetwork.iowa,
    google_compute_subnetwork.italy,
    google_compute_subnetwork.brazil,
    google_compute_subnetwork.tokyo
  ]
}

# 2. HTTP Proxy
resource "google_compute_target_http_proxy" "tsa_http_proxy" {
  name    = "tsa-http-proxy"
  url_map = google_compute_url_map.tsa_url_map.id
}

# 3. URL Map
resource "google_compute_url_map" "tsa_url_map" {
  name            = "tsa-url-map"
  default_service = google_compute_backend_service.backend_service.id
}

# 4. Backend Service
resource "google_compute_backend_service" "backend_service" {
  name                            = "tsa-backend-service"
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  port_name                       = "http"
  protocol                        = "HTTP"
  timeout_sec                     = 10
  connection_draining_timeout_sec = 0

  backend {
    group           = google_compute_instance_group_manager.iowa.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
    max_utilization = 0.8
  }

  backend {
    group           = google_compute_instance_group_manager.brazil.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
    max_utilization = 0.8
  }

  backend {
    group           = google_compute_instance_group_manager.italy.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
    max_utilization = 0.8
  }

  backend {
    group           = google_compute_instance_group_manager.tokyo.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
    max_utilization = 0.8
  }

  health_checks = [google_compute_health_check.health_hc.self_link]
}

# 5. Health Check (shared by all backends)
resource "google_compute_health_check" "health_hc" {
  name = "tsa-health-check"

  http_health_check {
    port_specification = "USE_SERVING_PORT"
    request_path       = "/"
  }
}
