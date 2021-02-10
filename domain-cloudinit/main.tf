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
  name   = "debian"
  pool   = var.pool_name
  source = var.domain_source_url
  format = "qcow2"
}

resource "libvirt_domain" "domain" {
  name   = var.domain_name
  memory = var.memory_m
  vcpu   = var.vcpus
  cpu = {
    mode = "host-passthrough"
  }

  autostart = var.domain_autostart
  running   = var.running
  cloudinit = libvirt_cloudinit_disk.init.id

  network_interface {
    network_name = var.network_name
    mac          = var.domain_mac
  }

  disk {
    volume_id = libvirt_volume.debian.id
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}
