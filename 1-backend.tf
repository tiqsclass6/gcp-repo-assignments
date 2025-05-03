# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket      = "samba-saturday-050325"
    prefix      = "terraform/state"
    credentials = "class-6-5-tiqs-095c33bf9f57.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
