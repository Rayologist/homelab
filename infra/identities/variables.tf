variable "state_bucket" {
  description = "The R2 bucket that stores this stack's OpenTofu state."
  type        = string
}

variable "identities" {
  type = map(object({
    given_name     = string
    family_name    = string
    email          = string
    forward_to     = optional(string)
    recovery_email = optional(string)
    recovery_phone = optional(string)
  }))
}

variable "initial_password" {
  type      = string
  sensitive = true
}

variable "cloudflare_zone_id" {
  type = string
}

variable "cloudflare_account_id" {
  type = string
}

variable "googleworkspace_customer_id" {
  type = string
}
