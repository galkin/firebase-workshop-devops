terraform {
  cloud {
    organization = "galkin"
    hostname     = "app.terraform.io"

    workspaces {
      name = "firebase-shared"
    }
  }

  required_version = ">= 1.4.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.57.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.57.0"
    }
  }
}

provider "google" {
  credentials = file("../../terraform-key.json")
  project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  credentials = file("../../terraform-key.json")
  project     = var.project_id
  region      = var.region
}
