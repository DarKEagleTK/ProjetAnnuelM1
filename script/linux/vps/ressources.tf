resource "proxmox_vm_qemu" "test" {
    name = "test"
    desc = "test terrafom"
    vmid = "401"
    target_node = "serv-host-001"

    agent = 1
    
    clone = "template-serv-debian"
    cores = 2
    sockets = 1
    memory = 2048

    network {
        bridge = "vmbr3"
        model = "virtio"
    }

    disk {
        storage = "disque1"
        type = "virtio"
        size = "20G"
    }

    os_type = "cloud-init"
    ipconfig0 = "ip=172.16.0.10/16,qw=172.16.0.254"
    nameserver = "172.16.0.254"
    ciuser = "admuser"
    sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQClTE+4Bd5qGkQB9Ro0D/s388Hp95zKgi7E27ug76Ee3RfyprOwJf0fm4r+IIwTUuYTYoPRV808uuHtiG8TMxU2WlJr5N7YDRGV/MUyHetOpYNM1YOQZ47b64/c9NhVWisfkmd/xlNxvCFNd8PZZXpZCm9rzsEqAr/DR804wlztPFQHvOa4ceMAwwV9ZqHwW4rM1GEpUsFBQ+7ppkm1qMfUS9RjY4ZVcK4Lal0aUqbbNypvb4Ci3S2hqydKH0AK7RqtyEntQEX3GYT7szK6i0NcwI7w/jYCOgJ8uVMt4DTD5wrwzjvY6/HPcEtwWY2Cxy9kzY+tRABTS6r2WXQgx3eoikpbPmuLy1536xvCi5LlamBn5mGdGmzPz9hF9LeqXSD9pJOfC7GN1u3X+6NVKKzNsMqI91dMU72z19od4wc3IH5NowEoAQhijxdV7Rh8F0FQznn0vh2ZA+XHygpvAXx9x+Hh6WqOtEe7izTz+g+qsgmXHEhdYNr1Hb3PXWxZWzU= dimas@DarKEagle"

}