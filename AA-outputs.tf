# https://developer.hashicorp.com/terraform/language/values/outputs

output "instance_external_ips" {
  value = {
    "${google_compute_instance.italy.name}"  = "http://${google_compute_instance.italy.network_interface[0].access_config[0].nat_ip}"
    "${google_compute_instance.tokyo.name}"  = "http://${google_compute_instance.tokyo.network_interface[0].access_config[0].nat_ip}"
    "${google_compute_instance.brazil.name}" = "http://${google_compute_instance.brazil.network_interface[0].access_config[0].nat_ip}"
  }
  description = "External IPs of all VMs"
}
