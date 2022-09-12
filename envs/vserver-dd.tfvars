provider_uri = "qemu+ssh://soeren@vserver.dd.soerenschneider.net/system"

datacenter = "dd"

domains = {
  fileserver = {
    memory        = 2048
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30g
    block_devices = ["/dev/disk/by-uuid/2a545d87-a795-42d9-be84-3c6a10f09d5d"]
  }
  minio-1 = {
    memory        = 3072
    vcpus         = 3
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30g
    block_devices = ["/dev/disk/by-uuid/dbe7c3dd-1552-4f37-b6a3-953bfc22635d"]
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
  k8s-master-1 = {
    memory        = 2048
    vcpus         = 2
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30g
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
