# tf-libvirt

## Example config file
```yaml
local_hosts:
  dc01:
    - host: vm-1
      physical: "aa:bb:cc:dd:ee:ff"
      logical: 10.0.3.1
      vm_config:
        host: vserver
        memory: 2048
        disk_size_b: 53687091200
        vcpus: 2
        os: debian-12
        block_devices:
          - /dev/mapper/libvirt-vm-1

  dc02:
    - host: vm-x
      physical: "aa:bb:cc:dd:ff:00"
      logical: 10.0.3.25
      vm_config:
        host: vserver
        memory: 2048
        disk_size_b: 53687091200
        vcpus: 2
        os: debian-12
```
