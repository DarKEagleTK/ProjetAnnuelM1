#!/bin/bash

variable=$1
#Récupération des variables (paramètre $variable)
RADICAL=$(echo $variable| awk -F'www.' '{print $2}' | awk -F'.' '{print $1}')
echo $RADICAL

#Création du dossier de deploiement
mkdir $RADICAL-folder && cd $RADICAL-folder/

#Copie du dossier ou zip dans /tmp/ dans ./
if [ -f /tmp/$RADICAL.zip ]; then
    unzip /tmp/$RADICAL.zip -d /home/admuser/$RADICAL-folder
else
    cp -r /tmp/$RADICAL/* /home/admuser/$RADICAL-folder/
fi

#Création du nom de l'espace pour le conteneur dédié
kubectl create namespace $RADICAL-ns

#Création de la ConfigMap selon le dossier spécifié
kubectl create configmap $RADICAL-cm --from-file=/home/admuser/$RADICAL-folder/ -n=$RADICAL-ns

#Création du fichier deployment.yaml (qui contiendra également le service.yaml)
cp /home/admuser/template_deployment.yaml deployment.yaml

#modification du fichier deployment.yaml selon les variables
sed -i -e "s/RADICAL/$RADICAL/g" deployment.yaml

#Application du deployment.yaml dans le NAMESPACE spécifié
kubectl apply -n $RADICAL-ns -f "./deployment.yaml"