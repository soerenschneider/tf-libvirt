provider_uri = "qemu+ssh://soeren@vserver.dd.soerenschneider.net/system"

domains = {
  fileserver = {
    memory        = 2048
    vcpus         = 4
    running       = true
    mac           = "ee:32:bc:cf:89:9d"
    os            = "debian-11"
    disk_size_b   = 30678339291 # 30g
    block_devices = ["/dev/disk/by-uuid/2a545d87-a795-42d9-be84-3c6a10f09d5d"]
  }
  minio = {
    memory        = 2048
    vcpus         = 4
    running       = true
    mac           = "ee:32:bc:cf:89:01"
    os            = "debian-11"
    disk_size_b   = 30678339291 # 30g
    block_devices = []
  }
}
