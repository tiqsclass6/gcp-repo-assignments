# https://registry.terraform.io/providers/hashicorp/google/latest/docs

provider "google" {
  project     = "your-project-id" # Insert your project id here
  region      = "uscentral1"
  credentials = "yourjsoncert.json" # Insert your json credentials here
}