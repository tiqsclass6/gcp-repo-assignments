# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket      = "your-project-id" # Insert your project ID here
    prefix      = "terraform/state"
    credentials = "yourjsoncert.json" # Insert your json credential here
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
