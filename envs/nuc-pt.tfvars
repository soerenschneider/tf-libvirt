provider_uri = "qemu+ssh://soeren@nuc.pt.soerenschneider.net/system"

iso_urls = {
  "debian-11" = "https://cloud.debian.org/images/cloud/bullseye/20220503-998/debian-11-generic-amd64-20220503-998.qcow2"
  "ubuntu-2204" = "https://cloud-images.ubuntu.com/jammy/20220616/jammy-server-cloudimg-amd64-disk-kvm.img"
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
  mqtt = {
    memory        = 256
    vcpus         = 1
    running       = true
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  hermit = {
    memory        = 1024
    vcpus         = 2
    running       = true
    os            = "ubuntu-2204"
    disk_size_b   = 20737418240 # 10g
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
  k8s-node-3 = {
    memory        = 8192
    vcpus         = 3
    running       = true
    os            = "debian-11"
    disk_size_b   = 51130567680 # 50g
    block_devices = []
  }
}
