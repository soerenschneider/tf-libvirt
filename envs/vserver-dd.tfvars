provider_uri = "qemu+ssh://soeren@vserver.dd.soeren.cloud/system"

datacenter = "dd"

iso_urls = {
  "debian-11" = "https://cdimage.debian.org/cdimage/cloud/bullseye/20220816-1109/debian-11-generic-amd64-20220816-1109.qcow2"
  "ubuntu-2204" = "https://cloud-images.ubuntu.com/releases/22.04/release-20220810/ubuntu-22.04-server-cloudimg-amd64-disk-kvm.img"
  "ubuntu-2204-full" = "https://cloud-images.ubuntu.com/releases/22.04/release-20220923/ubuntu-22.04-server-cloudimg-amd64.img"
}

vm_host = "vserver"
