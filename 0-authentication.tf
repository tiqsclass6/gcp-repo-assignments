# https://registry.terraform.io/providers/hashicorp/google/latest/docs

provider "google" {
  project     = "your-project-id"   # Insert your project id here
  region      = "us-central1"
  credentials = "yourjsonkey.json"  # Insert your json credentials here
}