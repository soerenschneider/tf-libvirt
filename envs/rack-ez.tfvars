provider_uri = "qemu+ssh://soeren@rack.ez.soerenschneider.net/system"

iso_urls = {
  "debian-11" = "https://cdimage.debian.org/images/cloud/bullseye/20220328-962/debian-11-generic-amd64-20220328-962.qcow2"
  "ubuntu-2204" = "https://cloud-images.ubuntu.com/jammy/20220616/jammy-server-cloudimg-amd64-disk-kvm.img"
}

datacenter = "ez"

domains = {
  fileserver = {
    memory        = 1536
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30 g
    block_devices = ["/dev/disk/by-uuid/e61176dc-7357-4119-bfe2-5345ed746208"]
  }
  sauron = {
    memory        = 1536
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 21474836480 # 20 g
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
  k8s-master-2 = {
    memory        = 2048
    vcpus         = 3
    running       = true
    os            = "ubuntu-2204"
    disk_size_b   = 21474836480 # 20 g
    block_devices = []
  }
  minio-1 = {
    memory        = 2048
    vcpus         = 2
    running       = true
    os            = "ubuntu-2204"
    disk_size_b   = 21474836480 # 20 g
    block_devices = ["/dev/disk/by-uuid/a319288e-3a2e-494a-84ea-e69df466dda2"]
  }
}
