# https://registry.terraform.io/providers/hashicorp/google/latest/docs

provider "google" {
  project     = "your-project-id" # Insert your project id here
  region      = "us-central1"
  credentials = "yourjsoncert.json" # Insert your json credential here
}
