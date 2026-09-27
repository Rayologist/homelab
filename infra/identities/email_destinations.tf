data "cloudflare_email_routing_addresses" "destinations" {
  account_id = var.cloudflare_account_id
}

locals {
  verified_forwarding_addresses = toset([
    for destination in data.cloudflare_email_routing_addresses.destinations.result :
    destination.email
    if destination.verified != null && destination.verified != ""
  ])
}
