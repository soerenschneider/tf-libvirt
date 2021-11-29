provider_uri = "qemu+ssh://soeren@nuc.dd.soerenschneider.net/system"

domains = {
  minio = {
    memory        = 1024
    vcpus         = 1
    running       = true
    mac           = "ee:32:c1:64:64:64"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  hass = {
    memory        = 1024
    vcpus         = 1
    running       = true
    mac           = "ee:32:c1:64:32:80"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  acme = {
    memory        = 256
    vcpus         = 1
    running       = true
    mac           = "ee:32:c1:64:16:84"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  sauron = {
    memory        = 1024
    vcpus         = 2
    running       = true
    mac           = "ee:32:cc:12:f0:10"
    os            = "debian-11"
    disk_size_b   = 10737418240 # 10g
    block_devices = []
  }
  pim = {
    memory        = 512
    vcpus         = 1
    running       = true
    mac           = "ee:32:cc:12:12:06"
    os            = "debian-11"
    disk_size_b   = 10737418240 # 10g
    block_devices = []
  }
  auth = {
    memory        = 512
    vcpus         = 1
    running       = true
    mac           = "ee:32:cc:af:fe:88"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  mqtt = {
    memory        = 512
    vcpus         = 2
    running       = true
    mac           = "ee:32:cc:41:aa:96"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
}
