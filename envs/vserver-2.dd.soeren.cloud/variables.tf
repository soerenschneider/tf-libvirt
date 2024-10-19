variable "provider_uri" {
  description = "uri to the provider endpoint"
  type        = string
}

variable "ssh_public_key_file" {
  description = "file that contains the ssh public key"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "ssh_fallback_public_keys" {
  description = "ssh public key"
  type        = string
  default     = ""
}

variable "iso_urls" {
  description = "url to fetch debian iso from"
  type        = map(string)
}
