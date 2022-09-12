provider_uri = "qemu+ssh://soeren@brick.dd.soerenschneider.net/system"

iso_urls = {
  "debian-11" = "https://cloud.debian.org/images/cloud/bullseye/20220328-962/debian-11-generic-amd64-20220328-962.qcow2"
  "ubuntu-2204" = "https://cloud-images.ubuntu.com/jammy/20220616/jammy-server-cloudimg-amd64-disk-kvm.img"
}

datacenter = "dd"

domains = {
  hass = {
    memory        = 1024
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  dyndns = {
    memory        = 256
    vcpus         = 1
    running       = true
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  acme = {
    memory        = 256
    vcpus         = 1
    running       = true
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  pim = {
    memory        = 512
    vcpus         = 1
    running       = true
    os            = "debian-11"
    disk_size_b   = 10737418240 # 10g
    block_devices = []
  }
  mqtt = {
    memory        = 512
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  k8s-node-1 = {
    memory        = 20480
    vcpus         = 7
    running       = true
    os            = "debian-11"
    disk_size_b   = 107374182400 # 100g
    block_devices = []
  }
  docker = {
    memory        = 4096
    vcpus         = 4
    running       = true
    os            = "ubuntu-2204"
    disk_size_b   = 53687091200 # 50g
    block_devices = []
  }
  minio-4 = {
    memory        = 3072
    vcpus         = 3
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30g
    block_devices = ["/dev/disk/by-uuid/2f1b6a68-a753-4e41-84c9-62a52ecc39c0"]
  }
}
