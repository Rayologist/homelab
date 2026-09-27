terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.24.0"
    }
  }
  required_version = ">= 1.1.26"
}
provider "cloudflare" {}
