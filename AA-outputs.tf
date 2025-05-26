# https://developer.hashicorp.com/terraform/language/values/outputs

output "instance_external_ips" {
  value = {
    "${google_compute_instance.italy1.name}"  = "http://${google_compute_instance.italy1.network_interface[0].access_config[0].nat_ip}"
    "${google_compute_instance.tokyo1.name}"  = "http://${google_compute_instance.tokyo1.network_interface[0].access_config[0].nat_ip}"
    "${google_compute_instance.brazil1.name}" = "http://${google_compute_instance.brazil1.network_interface[0].access_config[0].nat_ip}"
  }
  description = "External IPs of all VMs"
}
