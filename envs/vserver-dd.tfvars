provider_uri = "qemu+ssh://soeren@vserver.dd.soerenschneider.net/system"

datacenter = "dd"

domains = {
  fileserver = {
    memory        = 2048
    vcpus         = 4
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30g
    block_devices = ["/dev/disk/by-uuid/2a545d87-a795-42d9-be84-3c6a10f09d5d"]
  }
  minio = {
    memory        = 2048
    vcpus         = 4
    running       = true
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30g
    block_devices = []
  }
  mysql = {
    memory        = 2048
    vcpus         = 3
    running       = true
    os            = "debian-11"
    disk_size_b   = 10226113536 # 10g
    block_devices = []
  }
  roach = {
    memory        = 2048
    vcpus         = 2
    running       = true
    os            = "ubuntu-2204"
    disk_size_b   = 30678339584 # 30g
    block_devices = []
  }
}
