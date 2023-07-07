#!/bin/bash

if [ "$#" -ne 7 ]; then
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

#destroy last ressources.tf
rm ressources.tf
#generate base_file
cp ./ressources.tf.new ./ressources.tf

#OS -> de base, format debian. pas de modif si debian selectionner
if [[ $os == "centos" ]]; then
    sed -i 's/"template-serv-debian"/"template-serv-centos8"/g' ressources.tf
fi

#name
sed -i 's/"test"/"'$name'"/g' ressources.tf
#vmid
sed -i 's/"401"/"'$vmid'"/g' ressources.tf
#core
sed -i 's/cores = 2/cores = '$core'/g' ressources.tf
#memoire
sed -i 's/4096/'$memoire'/g' ressources.tf
#ip
sed -i 's/172.16.0.10/'$ip'/g' ressources.tf
#sshkey
echo '    sshkeys = "'$sshkeys'"' >> ressources.tf
echo '}' >> ressources.tf

#lunch terraform
terraform init
terraform apply -auto-approuve