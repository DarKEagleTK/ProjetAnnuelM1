#!/bin/bash

if [ "$#" -ne 5 ]; then
    echo "Usage: $0 os name vmid core memoire ip disksize user 'sshkeys'"
    exit 1
fi

os=$1
name=$2
vmid=$3
core=$4
memoire=$5
ip=$6
disksize=$7
user=$8
sshkeys=$9

var_generator ()
{
    #generate base_file
    cp ./variable.tf.new ./variables.tf
}

add_var ()
{
    #add variables in ./variables.tf
}

if [[ os == "debian" ]]; then
    #ajout debian dans les variables
    add_var()
elif [[ os == "centos" ]]; then
    #ajout centos dans les variables
    add_var()
fi
