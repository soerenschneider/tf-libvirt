locals {
  hosts_file = "~/src/gitlab/ansible/inventory/prod/group_vars/all/hosts.yml"
  hosts_yaml = file(local.hosts_file)
  hosts_data = try(yamldecode(local.hosts_yaml), [])

  ssh_pubkeys = distinct(compact(concat(try([chomp(file(var.ssh_public_key_file))], []), split(",", var.ssh_fallback_public_keys))))

  defined_hosts = flatten([for hosts_key, hosts_value in local.hosts_data : [
    for datacenter_key, datacenter_values in hosts_value : [
      for host in datacenter_values : host if lookup(host, "physical", null) != null
    ] if datacenter_key == var.datacenter
    ] if hosts_key == "local_hosts"
  ])

  hosts_macs = {
    for host in local.defined_hosts :
    host.host => host.physical
  }

  domains = {
    for host in local.hosts_data.local_hosts[var.datacenter] :
    host.host => host.vm_config
    if try(host.vm_config.host, "") == var.vm_host && try(host.vm_config.disabled, false) == false
  }

  mac_domains = { for domain, val in local.domains :
    domain => merge(val, { "mac" = lookup(val, "mac", null) != null ? val["mac"] : lookup(local.hosts_macs, domain, null) })
  }
}