variable "pool_name" {
  type        = string
  description = "Name of the storage pool"
  default     = "default"
}

variable "vcpus" {
  description = "VCPUs to attach to the domain"
  type        = number
  default     = 2
}

variable "memory_m" {
  description = "Memory in megabytes for the domain"
  type        = number
}

variable "create_volume" {
  type        = bool
  description = "LVM support is horrible. This bool specifies whether to create a volume automatically"
}

variable "disk_size_bytes" {
  description = "Disk size of the domain"
  default     = 21474836480 # 20G
  type        = number
}

variable "domain_name" {
  description = "Name of the domain"
  type        = string
}

variable "base_image_id" {
  description = "base image id"
  type        = string
}

variable "domain_autostart" {
  description = "Autostart the domain?"
  type        = bool
  default     = true
}

variable "running" {
  description = "Defines whether the instance is running or not"
  type        = bool
  default     = true
}

variable "network_name" {
  description = "Name of the network to attach the domain to"
  type        = string
}

variable "domain_mac" {
  description = "MAC address of the network the domain is attached to"
  type        = string
  default     = ""
}

variable "cloudinit_user_data" {
  description = "cloudinit user data file"
  type        = string
  default     = "templates/cloud_init.cfg"
}

variable "cloudinit_user_network" {
  description = "cloudinit network config file"
  type        = string
  default     = "templates/network_config.cfg"
}

variable "ssh_public_keys" {
  description = "SSH public key to install in the domain"
  type        = list(string)
}

variable "block_devices" {
  type    = list(string)
  default = []
}
