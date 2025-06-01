# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_health_check
# Resource: Regional Health Check

resource "google_compute_region_health_check" "health-hc" {
  name                = "health-hc"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}
