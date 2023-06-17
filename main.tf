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

locals {
  ssh_pubkeys = distinct(concat(try([chomp(file(var.ssh_public_key_file))], []), split(",", var.ssh_public_keys)))
  defined_hosts = flatten([for hosts_key, hosts_value in try(yamldecode(file(var.hosts_file)), {}) : [
    for datacenter_key, datacenter_values in hosts_value : [
      for host in datacenter_values : host if lookup(host, "physical", null) != null
    ] if datacenter_key == var.datacenter
    ] if hosts_key == "local_hosts"
  ])

  hosts_macs = {
    for host in local.defined_hosts :
    host.host => host.physical
  }

  domains = { for domain, val in var.domains :
    domain => merge(val, { "mac" = lookup(val, "mac", null) != null ? val["mac"] : lookup(local.hosts_macs, domain, null) })
  }
}

module "domains" {
  for_each    = local.domains
  source      = "./domain-cloudinit"
  domain_name = each.key

  memory_m        = each.value.memory
  vcpus           = each.value.vcpus
  running         = each.value.running
  base_image_id   = libvirt_volume.base[each.value.os].id
  block_devices   = each.value.block_devices
  domain_mac      = each.value.mac
  disk_size_bytes = each.value.disk_size_b

  provider_uri    = var.provider_uri
  ssh_public_keys = local.ssh_pubkeys

  pool_name    = libvirt_pool.default.name
  network_name = libvirt_network.bridge.name
}
