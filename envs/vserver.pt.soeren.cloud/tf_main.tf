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
  name     = "base-${each.key}"
  source   = each.value
  format   = "qcow2"
  pool     = libvirt_pool.default.name
}

module "domains" {
  for_each    = local.mac_domains
  source      = "../../domain-cloudinit"
  domain_name = each.key

  memory_m        = each.value.memory
  vcpus           = each.value.vcpus
  running         = lookup(each.value, "running", true)
  base_image_id   = try(each.value.create_volume, false) ? libvirt_volume.base[each.value.os].id : null
  block_devices   = try(each.value.block_devices, [])
  domain_mac      = each.value.mac
  create_volume   = try(each.value.create_volume, false)
  disk_size_bytes = each.value.disk_size_b

  ssh_public_keys = local.ssh_pubkeys

  pool_name    = libvirt_pool.default.name
  network_name = libvirt_network.bridge.name
}
