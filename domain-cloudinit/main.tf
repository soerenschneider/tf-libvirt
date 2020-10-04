terraform {
  required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.6.2"
    }
  }
}

provider "libvirt" {
  uri = var.provider_uri
}

resource "libvirt_volume" "original-image" {
  name   = basename(var.image_uri)
  pool   = var.pool_name
  source = var.image_uri
}

resource "libvirt_volume" "resized-image" {
  name           = var.domain_name
  pool           = var.pool_name
  base_volume_id = libvirt_volume.original-image.id
  size           = var.disk_size_bytes
}

data "template_file" "user_data" {
  template = file(var.cloudinit_user_data)
  vars = {
    ssh_public_key = var.ssh_public_key
  }
}

data "template_file" "network_config" {
  template = file(var.cloudinit_user_network)
}

resource "libvirt_cloudinit_disk" "init" {
  name           = "${var.domain_name}_commoninit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = var.pool_name
}

resource "libvirt_domain" "domain" {
  name      = var.domain_name
  memory    = var.domain_memory_m
  vcpu      = var.domain_vcpus
  autostart = var.domain_autostart

  cloudinit = libvirt_cloudinit_disk.init.id

  network_interface {
    network_name = var.domain_network
    mac          = var.domain_mac
  }

  disk {
    volume_id = libvirt_volume.resized-image.id
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}

