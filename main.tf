terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }

  backend "gcs" {
    bucket = ""
    prefix = ""
  }
}

provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

resource "google_pubsub_topic" "main" {
  name=format("test-%s-pub-sub", var.environment)
}
