#!/bin/bash

if [ "$#" -ne 5 ]; then
    echo "Usage: $0 os name vmid core memoire ip 'sshkeys'"
    exit 1
fi

#récupération des variables
os=$1
name=$2
vmid=$3
core=$4
memoire=$5
ip=$6
sshkeys=$7


#generate base_file
cp ./variable.tf.new ./variables.tf

#OS -> de base, format debian. pas de modif si debian selectionner
if [[ $os == "centos" ]]; then
    sed -i 's/"template-serv-debian"/"template-serv-centos8"/g' variables.tf
fi

#name
sed -i 's/"test"/'$name'/g' variables.tf
#vmid
sed -i 's/"401"/'$vmid'/g' variables.tf
#core
sed -i 's/"2"/'$core'/g' variables.tf
#memoire
sed -i 's/"2048"/'$memoire'/g' variables.tf
#ip
sed -i 's/"ip=172.16.0.10/16,qw=172.16.0.254"/"ip='$ip'/16,qw=10.1.1.1"/g' variables.tf
#sshkey
sed -i 's/"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQClTE+4Bd5qGkQB9Ro0D/s388Hp95zKgi7E27ug76Ee3RfyprOwJf0fm4r+IIwTUuYTYoPRV808uuHtiG8TMxU2WlJr5N7YDRGV/MUyHetOpYNM1YOQZ47b64/c9NhVWisfkmd/xlNxvCFNd8PZZXpZCm9rzsEqAr/DR804wlztPFQHvOa4ceMAwwV9ZqHwW4rM1GEpUsFBQ+7ppkm1qMfUS9RjY4ZVcK4Lal0aUqbbNypvb4Ci3S2hqydKH0AK7RqtyEntQEX3GYT7szK6i0NcwI7w/jYCOgJ8uVMt4DTD5wrwzjvY6/HPcEtwWY2Cxy9kzY+tRABTS6r2WXQgx3eoikpbPmuLy1536xvCi5LlamBn5mGdGmzPz9hF9LeqXSD9pJOfC7GN1u3X+6NVKKzNsMqI91dMU72z19od4wc3IH5NowEoAQhijxdV7Rh8F0FQznn0vh2ZA+XHygpvAXx9x+Hh6WqOtEe7izTz+g+qsgmXHEhdYNr1Hb3PXWxZWzU= dimas@DarKEagle"/'$sshkeys'/g' variables.tf