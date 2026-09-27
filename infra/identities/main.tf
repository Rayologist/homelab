resource "googleworkspace_user" "identity" {
  for_each = var.identities

  primary_email = each.value.email
  password      = var.initial_password

  recovery_email = each.value.recovery_email != null ? each.value.recovery_email : each.value.forward_to
  recovery_phone = each.value.recovery_phone

  change_password_at_next_login = true

  name {
    given_name  = each.value.given_name
    family_name = each.value.family_name
  }

  lifecycle {
    ignore_changes = [
      password,
      change_password_at_next_login,
    ]
  }
}


resource "cloudflare_email_routing_rule" "identity" {
  for_each = {
    for key, identity in var.identities :
    key => identity
    if identity.forward_to != null
  }

  zone_id = var.cloudflare_zone_id

  lifecycle {
    precondition {
      condition     = contains(local.verified_forwarding_addresses, each.value.forward_to)
      error_message = "Forwarding destination ${each.value.forward_to} is missing or unverified in Cloudflare. Create it by applying infra/cloudflare/email-destinations or register it directly in Cloudflare; verify the email address before applying identities."
    }
  }

  enabled = true

  matchers = [{
    type  = "literal"
    field = "to"
    value = each.value.email
  }]

  actions = [{
    type  = "forward"
    value = [each.value.forward_to]
  }]
}
