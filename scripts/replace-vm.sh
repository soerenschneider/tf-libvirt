#!/usr/bin/env bash

set -eu

DOMAIN=$1
WORKSPACE=$2

if [[ "$(terraform workspace show)" != "${WORKSPACE}" ]]; then
    echo "Workspace ${WORKSPACE} not active, changing..."
    terraform workspace select "${WORKSPACE}"
fi


terraform apply -replace 'module.domains["'"${DOMAIN}"'"].libvirt_volume.os' -replace 'module.domains["'"${DOMAIN}"'"].libvirt_domain.domain' -var-file "envs/${WORKSPACE}.tfvars"
