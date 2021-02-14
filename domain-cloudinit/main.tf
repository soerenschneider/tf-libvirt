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

resource "libvirt_volume" "debian" {
  name   = "opensuse_leap"
  source = "https://cloud.debian.org/images/cloud/buster/20210201-535/debian-10-genericcloud-amd64-20210201-535.qcow2"
  format = "qcow2"
  pool   = var.pool_name
}

resource "libvirt_volume" "os" {
  name           = "${var.domain_name}-os"
  pool           = var.pool_name
  size           = var.disk_size_bytes
  base_volume_id = libvirt_volume.debian.id
}

resource "libvirt_domain" "domain" {
  name   = var.domain_name
  memory = var.memory_m
  vcpu   = var.vcpus
  cpu = {
    mode = "host-passthrough"
  }

  autostart  = var.domain_autostart
  running    = var.running
  cloudinit  = libvirt_cloudinit_disk.init.id
  qemu_agent = true

  network_interface {
    network_name = var.network_name
    mac          = var.domain_mac
  }

  # TODO: Wait for fix on https://github.com/dmacvicar/terraform-provider-libvirt/issues/728
  disk {
    volume_id = libvirt_volume.os.id
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
}
