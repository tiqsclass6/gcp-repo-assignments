# https://developer.hashicorp.com/terraform/language/values/outputs
# https://developer.hashicorp.com/terraform/language/functions/join

output "compute_zones" {
  description = "Comma-separated compute zones"

  value = {
    iowa   = join(", ", data.google_compute_zones.iowa-available.names)
    brazil = join(", ", data.google_compute_zones.brazil-available.names)
    italy  = join(", ", data.google_compute_zones.italy-available.names)
    tokyo  = join(", ", data.google_compute_zones.tokyo-available.names)
  }
}

# MIG Stability Status for Zonal Instance Group Managers
output "mig_stability_status" {
  value = {
    iowa   = google_compute_instance_group_manager.iowa.status[0].is_stable
    italy  = google_compute_instance_group_manager.italy.status[0].is_stable
    brazil = google_compute_instance_group_manager.brazil.status[0].is_stable
    tokyo  = google_compute_instance_group_manager.tokyo.status[0].is_stable
  }
}

# ALB Frontend Dynamic IP
output "global_lb_ip_address" {
  description = "The dynamic IP address of the load balancer."
  value       = "http://${google_compute_global_forwarding_rule.entry_point.ip_address}"
}