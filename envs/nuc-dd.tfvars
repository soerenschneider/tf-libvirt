provider_uri = "qemu+ssh://soeren@nuc.dd.soerenschneider.net/system"

domains = {
  hass = {
    memory        = 1024
    vcpus         = 1
    running       = true
    mac           = "ee:32:c1:64:32:80"
    os            = "ubuntu2004"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  vault = {
    memory        = 1024
    vcpus         = 1
    running       = true
    mac           = "ee:32:c1:64:16:82"
    os            = "debian"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  acme = {
    memory        = 512
    vcpus         = 1
    running       = true
    mac           = "ee:32:c1:64:16:84"
    os            = "debian"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
}
