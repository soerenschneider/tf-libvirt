provider_uri = "qemu+ssh://soeren@vserver.ez.soerenschneider.net/system"

domains = {
  fileserver = {
    memory        = 1536
    vcpus         = 2
    running       = true
    mac           = "70:85:C2:DD:37:25"
    os            = "debian-11"
    disk_size_b   = 30678339584 # 30 g
    block_devices = ["/dev/disk/by-uuid/e61176dc-7357-4119-bfe2-5345ed746208"]
  }
  sauron = {
    memory        = 1536
    vcpus         = 1
    running       = true
    mac           = "70:85:C2:FF:A6:88"
    os            = "debian-11"
    disk_size_b   = 21474836480 # 20 g
    block_devices = []
  }
  garage = {
    memory        = 512
    vcpus         = 1
    running       = false
    mac           = "70:85:C2:FF:A6:01"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5 g
    block_devices = []
  }
  minio = {
    memory        = 512
    vcpus         = 2
    running       = false
    mac           = "70:85:C2:FF:A6:02"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5 g
    block_devices = []
  }
  k8s-master-2 = {
    memory        = 2048
    vcpus         = 3
    running       = true
    mac           = "70:85:C2:FF:A6:03"
    os            = "debian-11"
    disk_size_b   = 10226113536 # 10 g
    block_devices = []
  }
  mysql = {
    memory        = 512
    vcpus         = 2
    running       = true
    mac           = "70:85:C2:FF:A6:04"
    os            = "debian-11"
    disk_size_b   = 10226113536 # 10 g
    block_devices = []
  }
}
