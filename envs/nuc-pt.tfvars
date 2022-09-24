provider_uri = "qemu+ssh://soeren@nuc.pt.soerenschneider.net/system"

iso_urls = {
  "debian-11" = "https://cloud.debian.org/images/cloud/bullseye/20220503-998/debian-11-generic-amd64-20220503-998.qcow2"
  "ubuntu-2204" = "https://cloud-images.ubuntu.com/jammy/20220616/jammy-server-cloudimg-amd64-disk-kvm.img"
  "ubuntu-2204-full" = "https://cloud-images.ubuntu.com/releases/22.04/release-20220923/ubuntu-22.04-server-cloudimg-amd64.img"
}

datacenter = "pt"

domains = {
  hass = {
    memory        = 1024
    vcpus         = 1
    running       = true
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  dyndns = {
    memory        = 512
    vcpus         = 1
    running       = true
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  k8s-node-pt-1 = {
    memory        = 12288
    vcpus         = 3
    running       = true
    os            = "ubuntu-2204-full"
    disk_size_b   = 134217728000 # 125g
    block_devices = []
  }
}
