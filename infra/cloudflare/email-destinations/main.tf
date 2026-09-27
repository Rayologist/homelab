resource "cloudflare_email_routing_address" "destination" {
  for_each = var.destination_addresses

  account_id = var.cloudflare_account_id
  email      = each.value
}
