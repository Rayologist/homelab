variable "state_bucket" {
  description = "The R2 bucket that stores OpenTofu state."
  type        = string
}

variable "cloudflare_account_id" {
  type = string
}

variable "destination_addresses" {
  description = "Forwarding destinations to register with Cloudflare. Each address must also be verified by its owner."
  type        = set(string)

  validation {
    condition     = alltrue([for email in var.destination_addresses : email != "" && email == trimspace(email)])
    error_message = "Destination addresses must not be empty or have surrounding whitespace."
  }
}
