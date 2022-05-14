provider_uri = "qemu+ssh://soeren@rack.ez.soerenschneider.net/system"

iso_urls = {
  "debian-11" = "https://cdimage.debian.org/images/cloud/bullseye/20220328-962/debian-11-generic-amd64-20220328-962.qcow2"
}

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
    vcpus         = 2
    running       = true
    mac           = "70:85:C2:FF:A6:88"
    os            = "debian-11"
    disk_size_b   = 21474836480 # 20 g
    block_devices = []
  }
}
