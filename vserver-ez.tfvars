provider_uri = "qemu+ssh://soeren@vserver.ez.soerenschneider.net/system"

domains = {
  fileserver = {
    memory        = 1536
    vcpus         = 2
    running       = true
    mac           = "70:85:C2:DD:37:25"
    os            = "debian"
    block_devices = ["/dev/disk/by-uuid/e61176dc-7357-4119-bfe2-5345ed746208"]
  }
}
