locals {
  domains = yamldecode(file("domains.yaml"))
  ssh_pubkeys = distinct(compact(concat(try([chomp(file(var.ssh_public_key_file))], []), split(",", var.ssh_fallback_public_keys))))
}

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
  for_each    = { for domain in local.domains : domain.name => domain }
  source      = "../../domain-cloudinit"
  domain_name = each.key

  memory_m        = each.value.memory
  vcpus           = each.value.vcpus
  running         = lookup(each.value, "running", true)
  base_image_id   = try(each.value.create_volume, false) ? libvirt_volume.base[each.value.os].id : null
  block_devices   = try(each.value.block_devices, [])
  domain_mac      = try(each.value.mac, null)
  create_volume   = try(each.value.create_volume, false)
  disk_size_bytes = try(each.value.disk_size_g, 5) * 1073741824

  ssh_public_keys = local.ssh_pubkeys

  pool_name    = libvirt_pool.default.name
  network_name = libvirt_network.bridge.name
}
