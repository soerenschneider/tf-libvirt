resource "libvirt_pool" "default" {
  name = "default"
  type = "dir"
  path = "/var/lib/libvirt/images"
}

resource "libvirt_network" "bridge" {
  name   = "bridge"
  mode   = "bridge"
  bridge = "br0"
}

module "domains" {
  for_each          = var.domains
  source            = "./domain-cloudinit"
  domain_name       = each.key
  memory_m          = each.value.memory
  vcpus             = each.value.vcpus
  running           = each.value.running
  pool_name         = libvirt_pool.default.name
  network_name      = libvirt_network.bridge.name
  provider_uri      = var.provider_uri
  domain_mac        = each.value.mac
  ssh_public_key    = var.ssh_public_key
  domain_source_url = var.iso_urls[each.value.os]
}
