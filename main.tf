resource "libvirt_pool" "default" {
  name = "default"
  type = "dir"
  path = "/var/lib/libvirt/images"
}

resource "libvirt_network" "bridge" {
  name      = "bridge"
  mode      = "bridge"
  bridge    = "br0"
  autostart = true
}

resource "libvirt_volume" "base" {
  for_each = var.iso_urls
  name   = "base-${each.key}"
  source = each.value
  format = "qcow2"
  pool   = libvirt_pool.default.name
}

module "domains" {
  for_each    = var.domains
  source      = "./domain-cloudinit"
  domain_name = each.key

  memory_m      = each.value.memory
  vcpus         = each.value.vcpus
  running       = each.value.running
  base_image_id = libvirt_volume.base[each.value.os].id
  block_devices = each.value.block_devices
  domain_mac    = each.value.mac
  disk_size_bytes = each.value.disk_size_b

  provider_uri      = var.provider_uri
  ssh_public_keys   = var.ssh_public_keys

  pool_name    = libvirt_pool.default.name
  network_name = libvirt_network.bridge.name
}
