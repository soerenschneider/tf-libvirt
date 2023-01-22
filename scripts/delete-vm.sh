#!/usr/bin/env bash

set -ue

VM="$1"

echo "You are about to delete the current resource from state for workspace $(terraform workspace show):"
echo "------------------------------------------------------------"
echo $VM
echo "------------------------------------------------------------"

read -p "Are you sure? " -n 1 -r
echo ""

if [[ ${REPLY} =~ ^[Yy]$ ]]
then
    echo "Proceeding"
    set +e
    terraform state rm 'module.domains["'${VM}'"].data.template_file.network_config'
    terraform state rm 'module.domains["'${VM}'"].data.template_file.user_data'
    terraform state rm 'module.domains["'${VM}'"].libvirt_cloudinit_disk.init'
    terraform state rm 'module.domains["'${VM}'"].libvirt_domain.domain'
    terraform state rm 'module.domains["'${VM}'"].libvirt_volume.os'
else
    echo "OK, bye"
fi

