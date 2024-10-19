# tf-libvirt

![gitleaks](https://github.com/soerenschneider/tf-libvirt/actions/workflows/gitleaks.yaml/badge.svg)
![lint-workflow](https://github.com/soerenschneider/tf-libvirt/actions/workflows/lint.yaml/badge.svg)
![security-workflow](https://github.com/soerenschneider/tf-libvirt/actions/workflows/security.yaml/badge.svg)

## Example config file
```yaml
- name: "database"
  memory: 4096
  mac: "xx:xx:xx:xx:xx:xx"
  disk_size_g: 75
  vcpus: 2
  os: debian-12
  create_volume: true
```
