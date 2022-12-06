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
    block_devices = [
      "/dev/disk/by-uuid/b87d58f7-38b0-4d05-974f-a84f8f338c2a",
      "/dev/disk/by-uuid/e1f60110-8fcb-4745-b7d5-39e310b335be"
    ]
  }
  k8s-prd-master-1 = {
    memory        = 3072
    vcpus         = 3
    running       = true
    os            = "ubuntu-2204-full"
#    disk_size_b   = 53687091200 # 50g
    disk_size_b   = 32212254720 # 50g
    block_devices = []
  }
  k8s-prd-node-dd-2 = {
    memory        = 13312
    vcpus         = 3
    running       = true
    os            = "ubuntu-2204-full"
    disk_size_b   = 32212254720 # 175g 
#    disk_size_b   = 187904819200 # 175g 
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
