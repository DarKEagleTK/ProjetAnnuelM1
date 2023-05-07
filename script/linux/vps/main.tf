provider "proxmox" {
    pm_api_url = "https://192.168.0.121:8006/api2/json"
    pm_user = "terraform"
    pm_password = "terraform"
}

resource "proxmox_vm_qemu" "VPS" {
  # nom du node
  target_node = "serv-host-001"
  
  #configuration physique de la machine
  name = var.vm_name
  memory = var.vm_memory
  sockets = 1
  core = var.vm_core
  os_type = var.vm_os
  scsihw = "virtio-scsi-pci"
  iso = var.vm_iso
  bootdisk = "scsi0"
  agent = 1
  onboot = false
  
  #réseau
  network_interface {
    model = "virtio"
    bridge = "vmbr1"
    ipv4_address = var.vm_ip
  }

  #disque
  disk {
    storage = "disque2"
    size = var.vm_disk_size
    type = "scsi"
    cache = "writeback"
  }

  #pour les drivers windows
  dynamic "qemu_drive" {
    for_each = var.vm_os == "windows" && var.vm_virtio_win_iso != "" ? [1] : []
    content {
      file   = var.vm_virtio_win_iso
      format = "raw"
      interface = "ide"
      index = 3
    }
  }

  provisioner "remote-exec" {
    when = var.vm_os == "l26"

    inline = [file()]
    connection {
        type = "ssh"
        host = self.network_interface[0].ipv4_address
    }
  }

}