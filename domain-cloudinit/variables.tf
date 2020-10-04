variable "pool_name" {
  type        = string
  description = "Name of the storage pool"
  default     = "default"
}

variable "provider_uri" {
  description = "uri to the provider endpoint"
}

variable "domain_vcpus" {
  description = "VCPUs to attach to the domain"
  type        = number
  default     = 2
}

variable "domain_memory_m" {
  description = "Memory in megabytes for the domain"
  type        = number
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

variable "domain_autostart" {
  description = "Autostart the domain?"
  type        = bool
  default     = true
}

variable "domain_network" {
  description = "Name of the network to attach the domain to"
  type        = string
  default     = "host-bridge"
}

variable "domain_mac" {
  description = "MAC address of the network the domain is attached to"
  type        = string
  default     = ""
}

variable "image_uri" {
  description = "Cloudinit image uri"
  type        = string
  #default = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
  default = "http://mirror.scaleuptech.com/ubuntu-cloud-images/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
}

variable "cloudinit_user_data" {
  description = "cloudinit user data file"
  default     = "cloud_init.cfg"
}

variable "cloudinit_user_network" {
  description = "cloudinit network config file"
  default     = "network_config.cfg"
}

variable "ssh_public_key" {
  description = "SSH public key to install in the domain"
  type        = string
}
