provider_uri = "qemu+ssh://soeren@vserver.pt.soerenschneider.net/system"

domains = {
  fileserver = {
    memory        = 2048
    vcpus         = 2
    running       = true
    mac           = "ee:32:bc:ff:89:12"
    os            = "debian-11"
    disk_size_b   = 7158279168 # 7g
    block_devices = ["/dev/disk/by-uuid/7eac2dd2-8857-4081-a0bd-3c883682cdd2"]
  }
  sauron = {
    memory        = 1024
    vcpus         = 2
    running       = true
    mac           = "ee:32:bc:ff:89:13"
    os            = "debian-11"
    disk_size_b   = 10737418240 # 10g
    block_devices = []
  }
}
