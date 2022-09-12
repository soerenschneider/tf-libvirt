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
  minio-3 = {
    memory        = 3072
    vcpus         = 3
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30g
    block_devices = ["/dev/disk/by-uuid/ecaa03b1-f0e4-45da-b71d-1e983a0d66b8"]
  }
  mysql = {
    memory        = 3072
    vcpus         = 3
    running       = true
    os            = "debian-11"
    disk_size_b   = 76695851520 # 75g
    block_devices = []
  }
  roach = {
    memory        = 3072
    vcpus         = 3
    running       = true
    os            = "ubuntu-2204"
    disk_size_b   = 76695851520 # 75g
    block_devices = []
  }
  k8s-master-3 = {
    memory        = 2048
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30g
    block_devices = []
  }
}
