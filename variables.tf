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

variable "vm_host" {
  type        = string
  description = "the name of this vm host"
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

#variable "domains" {
#  type = map(object({
#    memory        = number
#    vcpus         = number
#    mac           = optional(string)
#    os            = string
#    create_volume = bool
#    disk_size_b   = number
##   running       = optional(bool, true)
#    block_devices = optional(list(string), [])
#  }))
#}
