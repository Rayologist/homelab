output "cloudflare_account_id" {
  value = var.cloudflare_account_id
}

output "destination_addresses" {
  description = "Destination addresses managed in this state, keyed by email. Registration does not imply email verification."
  value = {
    for email, destination in cloudflare_email_routing_address.destination :
    email => destination.id
  }
}
