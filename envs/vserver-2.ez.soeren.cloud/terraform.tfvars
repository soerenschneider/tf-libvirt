provider_uri = "qemu+ssh://soeren@vserver-2.ez.soeren.cloud/system"
hosts_file   = "/home/soeren/src/gitlab/ansible/inventory/prod/group_vars/all/hosts.yml"

datacenter = "ez"
vm_host    = "vserver-2"

iso_urls = {
  "debian-12" = "https://cloud.debian.org/images/cloud/bookworm/20240901-1857/debian-12-generic-amd64-20240901-1857.qcow2"
}
