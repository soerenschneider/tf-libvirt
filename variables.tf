variable "provider_uri" {
  description = "uri to the provider endpoint"
  type        = string
}

variable "ssh_public_keys" {
  description = "ssh public key"
  type        = string
}

variable "iso_urls" {
  description = "url to fetch debian iso from"
  type        = map(string)
}

variable "datacenter" {
  type    = string
  default = ""
}

variable "hosts_file" {
  type    = string
  default = ""
}

variable "domains" {
  type = map(object({
    memory        = number
    vcpus         = number
    mac           = optional(string)
    os            = string
    disk_size_b   = number
    running       = bool
    block_devices = list(string)
  }))
}
