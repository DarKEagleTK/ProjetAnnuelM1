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
    sed -i 's/template-serv-debian/template-serv-centos8/g' varaibles.tf
fi

#name
sed -i 's/test/$name/g' varaibles.tf
#vmid
sed -i 's/401/$vmid/g' varaibles.tf
#core
sed -i 's/2/$core/g' varaibles.tf
#memoire
sed -i 's/2048/$memoire/g' varaibles.tf
#ip
sed -i 's/ip=172.16.0.10/16,qw=172.16.0.254/ip=$ip/16,qw=10.1.1.1/g' varaibles.tf
#sshkey
sed -i 's/test/$name/g' varaibles.tf