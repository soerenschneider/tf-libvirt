provider_uri = "qemu+ssh://soeren@vserver.dd.soerenschneider.net/system"

datacenter = "dd"

iso_urls = {
  "debian-11" = "https://cdimage.debian.org/cdimage/cloud/bullseye/20220816-1109/debian-11-generic-amd64-20220816-1109.qcow2"
  "ubuntu-2204" = "https://cloud-images.ubuntu.com/releases/22.04/release-20220810/ubuntu-22.04-server-cloudimg-amd64-disk-kvm.img"
  "ubuntu-2204-full" = "https://cloud-images.ubuntu.com/releases/22.04/release-20220923/ubuntu-22.04-server-cloudimg-amd64.img"
}

domains = {
  fileserver = {
    memory        = 4096
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 53687091200 # 50g
    block_devices = ["/dev/disk/by-uuid/2a545d87-a795-42d9-be84-3c6a10f09d5d"]
  }
  dbs = {
    memory        = 8192
    vcpus         = 2
    running       = true
    os            = "ubuntu-2204"
    disk_size_b   = 76695852032 # 75g
    block_devices = ["/dev/disk/by-uuid/dbe7c3dd-1552-4f37-b6a3-953bfc22635d"]
  }
  k8s-master-1 = {
    memory        = 3072
    vcpus         = 3
    running       = true
    os            = "debian-11"
    disk_size_b   = 53687091200 # 50g
    block_devices = []
  }
  k8s-node-dd-2 = {
    memory        = 13312
    vcpus         = 3
    running       = true
    os            = "ubuntu-2204-full"
    disk_size_b   = 134217728000 # 125g
    block_devices = []
  }
  sauron = {
    memory        = 1024
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 10737418240 # 10g
    block_devices = []
  }
}
