provider_uri = "qemu+ssh://soeren@nuc.dd.soerenschneider.net/system"

domains = {
  k8 = {
    memory        = 8192
    vcpus         = 3
    running       = true
    mac           = "6c:06:2d:e6:de:0c"
    os            = "debian"
    disk_size_b   = 21474836480 # 20 g
    block_devices = []
  }
}
