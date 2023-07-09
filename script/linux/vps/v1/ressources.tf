resource "proxmox_vm_qemu" "test" {
    name = var.name
    desc = "terrafom VPS"
    vmid = var.vmid
    target_node = "serv-host-001"

    agent = 1
    
    clone = var.os_type
    cores = var.proc
    sockets = 1
    memory = var.memoires

    network {
        bridge = "vmbr1"
        model = "virtio"
    }

    disk {
        storage = "disque1"
        type = "virtio"
        size = "20G"
    }

    os_type = "cloud-init"
    ipconfig0 = var.ip_config
    nameserver = var.nameserver
    ciuser = "admuser"
    sshkeys = var.sshkeys_user

}