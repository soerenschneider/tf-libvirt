provider_uri = "qemu+ssh://soeren@vserver.pt.soerenschneider.net/system"

iso_urls = {
  "debian-11" = "https://cdimage.debian.org/cdimage/cloud/bullseye/20220816-1109/debian-11-generic-amd64-20220816-1109.qcow2"
  "ubuntu-2204" = "https://cloud-images.ubuntu.com/releases/22.04/release-20220810/ubuntu-22.04-server-cloudimg-amd64-disk-kvm.img"
  "ubuntu-2204-full" = "https://cloud-images.ubuntu.com/releases/22.04/release-20220923/ubuntu-22.04-server-cloudimg-amd64.img"
}

datacenter = "pt"

domains = {
  fileserver = {
    memory        = 4096
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 53687091200 # 50g
    block_devices = ["/dev/disk/by-uuid/7eac2dd2-8857-4081-a0bd-3c883682cdd2"]
  }
  sauron = {
    memory        = 1024
    vcpus         = 1
    running       = true
    os            = "debian-11"
    disk_size_b   = 16106127360 # 15g
    block_devices = []
  }
  dbs = {
    memory        = 6144
    vcpus         = 2
    running       = true
    os            = "ubuntu-2204"
    disk_size_b   = 76695852032 # 75g
    block_devices = [
     "/dev/disk/by-uuid/f7d253e2-ef36-4b59-a1a4-f40cd7108734",
     "/dev/disk/by-uuid/547b4963-91f7-4c73-91ea-2111c03625d0"
    ]
  }
  k8s-prd-master-3 = {
    memory        = 3096
    vcpus         = 2
    running       = true
    os            = "ubuntu-2204-full"
    disk_size_b   = 53687091200 # 50g
    block_devices = []
  }
}
