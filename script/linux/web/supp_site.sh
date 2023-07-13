#!/bin/bash

# Variables (paramètre $variable)
variable=$1
RADICAL=$(echo $variable| awk -F'www.' '{print $2}' | awk -F'.' '{print $1}')

#Désinstallation de déploiement
kubectl delete -n $RADICAL-ns deployment $RADICAL-deployment
kubectl delete -n $RADICAL-ns service $RADICAL-service
kubectl delete -n $RADICAL-ns cm $RADICAL-cm
kubectl delete ns $RADICAL-ns

#Suppression du dossier de conteneur
sudo rm -r $RADICAL-folder/