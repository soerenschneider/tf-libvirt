terraform {
  required_version = ">= 1.7"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.9.3"
    }
  }
}

provider "libvirt" {
  uri = var.provider_uri
}
