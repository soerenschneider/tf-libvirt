provider_uri = "qemu+ssh://soeren@nuc.pt.soerenschneider.net/system"

domains = {
  hass = {
    memory        = 1024
    vcpus         = 1
    running       = true
    mac           = "ee:32:c1:72:32:aa"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  garage = {
    memory        = 1024
    vcpus         = 1
    running       = true
    mac           = "ee:32:cc:72:32:ab"
    os            = "debian-11"
    disk_size_b   = 10737418240 # 10g
    block_devices = []
  }
  mqtt = {
    memory        = 256
    vcpus         = 1
    running       = true
    mac           = "ee:32:cc:72:32:ac"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  loki = {
    memory        = 1024
    vcpus         = 2
    running       = true
    mac           = "ee:32:cc:72:32:ad"
    os            = "debian-11"
    disk_size_b   = 10737418240 # 10g
    block_devices = []
  }
  dyndns = {
    memory        = 512
    vcpus         = 1
    running       = true
    mac           = "ee:32:bc:ff:89:17"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
}
