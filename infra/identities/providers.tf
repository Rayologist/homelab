terraform {
  required_version = ">= 1.10.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.24"
    }

    googleworkspace = {
      source  = "SamuZad/googleworkspace"
      version = "~> 0.12"
    }
  }
}

provider "cloudflare" {}

provider "googleworkspace" {
  customer_id = var.googleworkspace_customer_id
}
