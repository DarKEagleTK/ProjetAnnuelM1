#!/bin/bash

if [ "$#" -ne 5 ]; then
    echo "Usage: $0 os name core memoire ip"
    exit 1
fi

os = "$1"
vm_name = "$2"
vm_core = "$3"
vm_memoire = "$4"
vm_ip = "$5"

if [ $os == "l26" ]; then
    vm_os = "l26"
    vm_iso = "disque1:iso/debian-11.6.0-amd64-netinst.iso"
    vm_virtio_win_iso = ""
    vm_disk_size = "20G"
elif [ $os == "winserver2019" ]; then
    vm_os = "winserver2019"
    vm_iso = "disque1:iso/SERVER_EVAL_x64FRE_fr-fr.iso"
    vm_virtio_win_iso = "virtio-win-0.1.229.iso"
    vm_disk_size = "60G"
fi

echo -e `vm_name = $vm_name
vm_memoire = $vm_memoire
vm_core = $vm_core
vm_os = $vm_os
vm_iso = $vm_iso
vm_virtio_win_iso = $vm_virtio_win_iso
vm_disk_size = $vm_disk_size
vm_ip = $vm_ip`