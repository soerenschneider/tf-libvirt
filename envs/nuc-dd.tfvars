provider_uri = "qemu+ssh://soeren@nuc.dd.soerenschneider.net/system"

iso_urls = {
  "debian-11" = "https://cdimage.debian.org/images/cloud/bullseye/20211011-792/debian-11-generic-amd64-20211011-792.qcow2"
}

domains = {
  paperless = {
    memory        = 1024
    vcpus         = 2
    running       = true
    mac           = "ee:32:c7:86:81:00"
    os            = "debian-11"
    disk_size_b   = 10737418240 # 10g
    block_devices = []
  }
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
  dyndns = {
    memory        = 256
    vcpus         = 1
    running       = true
    mac           = "ee:32:c8:23:02:11"
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
  postgres = {
    memory        = 1024
    vcpus         = 2
    running       = true
    mac           = "ee:32:cc:98:b4:21"
    os            = "debian-11"
    disk_size_b   = 21474836480 # 20g
    block_devices = []
  }
  notifications = {
    memory        = 384
    vcpus         = 1
    running       = true
    mac           = "ee:32:cc:84:81:0f"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  garage = {
    memory        = 1024
    vcpus         = 2
    running       = true
    mac           = "ee:32:cc:84:86:0e"
    os            = "debian-11"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
}
