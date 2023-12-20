locals {
  ssh_public_keys = join(",", var.ssh_public_keys)
}

resource "libvirt_cloudinit_disk" "init" {
  name           = "${var.domain_name}_commoninit.iso"
  user_data      = templatefile(file("${path.module}/../${var.cloudinit_user_data}"), local.ssh_public_keys)
  network_config = templatefile("${path.module}/../${var.cloudinit_user_network}", {})
  pool           = var.pool_name
}

resource "libvirt_volume" "os" {
  count          = var.create_volume ? 1 : 0
  name           = "${var.domain_name}-os"
  pool           = var.pool_name
  size           = var.disk_size_bytes
  base_volume_id = var.base_image_id
}

resource "libvirt_domain" "domain" {
  name   = var.domain_name
  memory = var.memory_m
  vcpu   = var.vcpus
  cpu {
    mode = "host-passthrough"
  }

  autostart  = var.domain_autostart
  running    = var.running
  cloudinit  = libvirt_cloudinit_disk.init.id
  qemu_agent = true

  network_interface {
    network_name = var.network_name
    mac          = var.domain_mac
    bridge       = "br0"
  }

  # TODO: Wait for fix on https://github.com/dmacvicar/terraform-provider-libvirt/issues/728
  dynamic "disk" {
    for_each = libvirt_volume.os
    content {
      volume_id = disk.value.id
    }
  }

  dynamic "disk" {
    for_each = var.block_devices
    content {
      block_device = disk.value
    }
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
  graphics {
    type        = "vnc"
    listen_type = "address"
  }
}
