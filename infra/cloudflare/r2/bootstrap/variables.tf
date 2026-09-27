variable "cloudflare_account_id" {
  description = "The Cloudflare account ID where the R2 bucket will be created."
  type        = string
}

variable "bucket_name" {
  description = "The name of the R2 bucket."
  type        = string
}

variable "bucket_location" {
  description = "The location of the R2 bucket."
  type        = string
}
