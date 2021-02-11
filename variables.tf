variable "provider_uri" {
  description = "uri to the provider endpoint"
  type        = string
}

variable "ssh_public_key" {
  description = "ssh public key"
  type        = string
}

variable "iso_urls" {
  description = "url to fetch debian iso from"
  type        = map(string)
}

variable "domains" {
  type = map(object({
    memory        = number
    vcpus         = number
    mac           = string
    os            = string
    running       = bool
    block_devices = list(string)
  }))
}
