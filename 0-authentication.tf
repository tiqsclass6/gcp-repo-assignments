# https://registry.terraform.io/providers/hashicorp/google/latest/docs

provider "google" {
  project     = "your-bucket-name" # Insert your project id here
  region      = "europe-west8"
  credentials = "yourjsonkey.json" # Insert your json credentials here
}