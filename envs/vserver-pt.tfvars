provider_uri = "qemu+ssh://soeren@vserver.pt.soerenschneider.net/system"

datacenter = "pt"

domains = {
  fileserver = {
    memory        = 4096
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30g
    block_devices = ["/dev/disk/by-uuid/7eac2dd2-8857-4081-a0bd-3c883682cdd2"]
  }
  sauron = {
    memory        = 1024
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 10737418240 # 10g
    block_devices = []
  }
  minio-4 = {
    memory        = 2048
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30g
    block_devices = ["/dev/disk/by-uuid/ecaa03b1-f0e4-45da-b71d-1e983a0d66b8"]
  }
  mysql = {
    memory        = 2048
    vcpus         = 2
    running       = true
    mac           = "ee:32:bc:ff:89:16"
    os            = "debian-11"
    disk_size_b   = 10737418240 # 10g
    block_devices = []
  }
}
