variable "admuser" {
    default = "terraform"
}

variable "pm_uri_url" {
    default = "https://192.168.0.121:8006/api2/json"
}

variable "pm_user" {
    default = "terraform@pam!terraform"
}

variable "pm_password" {
    default = "e10f3396-ed62-49e9-804b-0a1f502f9a05"
}

variable "os_type" {
  default = "template-serv-debian"
}

variable "ip_config" {
  default = "ip=172.16.0.10/16,qw=172.16.0.254"
}

variable "nameserver" {
  default = "10.1.1.1"
}

variable "sshkeys_user" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQClTE+4Bd5qGkQB9Ro0D/s388Hp95zKgi7E27ug76Ee3RfyprOwJf0fm4r+IIwTUuYTYoPRV808uuHtiG8TMxU2WlJr5N7YDRGV/MUyHetOpYNM1YOQZ47b64/c9NhVWisfkmd/xlNxvCFNd8PZZXpZCm9rzsEqAr/DR804wlztPFQHvOa4ceMAwwV9ZqHwW4rM1GEpUsFBQ+7ppkm1qMfUS9RjY4ZVcK4Lal0aUqbbNypvb4Ci3S2hqydKH0AK7RqtyEntQEX3GYT7szK6i0NcwI7w/jYCOgJ8uVMt4DTD5wrwzjvY6/HPcEtwWY2Cxy9kzY+tRABTS6r2WXQgx3eoikpbPmuLy1536xvCi5LlamBn5mGdGmzPz9hF9LeqXSD9pJOfC7GN1u3X+6NVKKzNsMqI91dMU72z19od4wc3IH5NowEoAQhijxdV7Rh8F0FQznn0vh2ZA+XHygpvAXx9x+Hh6WqOtEe7izTz+g+qsgmXHEhdYNr1Hb3PXWxZWzU= dimas@DarKEagle"
}

variable "memoires" {
  default = "2048"
}

variable "proc" {
  default = "2"
}

variable "name" {
  default = "test"
}

variable "vmid" {
  default = "401"
}