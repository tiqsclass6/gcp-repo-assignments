terraform {
  backend "gcs" {
    bucket      = "your-bucket-name"  # Insert your bucket name here
    prefix      = "terraform/state"
    credentials = "yourjsonkey.json"  # Insert your json credentials here
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}