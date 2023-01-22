provider_uri = "qemu+ssh://soeren@nuc.pt.soeren.cloud/system"

iso_urls = {
  "ubuntu-2204-full" = "https://nas.ha.soeren.cloud/pub/images/ubuntu/2204/ubuntu-22.04-server-cloudimg-amd64.img"
}

datacenter = "pt"

domains = {
  dyndns = {
    memory        = 384
    vcpus         = 1
    running       = true
    os            = "ubuntu-2204-full"
    disk_size_b   = 5368709120 # 5g
    block_devices = []
  }
  k8s-prd-node-pt-1 = {
    memory        = 14336
    vcpus         = 4
    running       = true
    os            = "ubuntu-2204-full"
    disk_size_b   = 187904819200 # 175g
    block_devices = []
  }
}
