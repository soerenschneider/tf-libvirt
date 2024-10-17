#!/bin/sh

virsh pool-destroy default
virsh pool-undefine default

virsh net-destroy bridge
virsh net-undefine bridge

rm -i /var/lib/libvirt/images/*
