terraform {
  backend "gcs" {
    bucket      = "your-project-id"           # Insert your project ID here
    prefix      = "MMDDYYYY/terraform/state"
    credentials = "yourjsoncert.json"         # Insert your json credential here
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}