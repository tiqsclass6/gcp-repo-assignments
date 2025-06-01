# https://developer.hashicorp.com/terraform/language/values/outputs

output "instance_external_ips" {
  value = {
    "${google_compute_instance.iowa.name}"   = "http://${google_compute_instance.iowa.network_interface[0].access_config[0].nat_ip}"
    "${google_compute_instance.tokyo.name}"  = "http://${google_compute_instance.tokyo.network_interface[0].access_config[0].nat_ip}"
    "${google_compute_instance.brazil.name}" = "http://${google_compute_instance.brazil.network_interface[0].access_config[0].nat_ip}"
  }
  description = "External IPs of all VMs"
}

# ALB Frontend Static IP

output "lb_static_ip_address" {
  description = "The static IP address of the load balancer."
  value       = "http://${google_compute_address.lb.address}"
}

# https://developer.hashicorp.com/terraform/language/functions/join

output "compute_zones" {
  description = "Comma-separated compute zones"
  # convert set into string delimited by commas (CSV) before output
  value = join(", ", data.google_compute_zones.available.names)
}
