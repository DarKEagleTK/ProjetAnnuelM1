#!/bin/bash

#Demande des variables
#echo "Variables : NAMESPACE RADICAL DEPLOY_DIR NB_REPLICAS"
#read -s -p "Votre namespace ?" NAMESPACE; echo
#read -n 15 -s -p  "Le radical de nommage ?" RADICAL; echo
#read -s -p "Nom du dossier ?" DEPLOY_DIR; echo
#read -s -p "Nombre de replicas ?" NB_REPLICAS; echo
#echo "Variables : $NAMESPACE $RADICAL $DEPLOY_DIR $NB_REPLICAS"

#Récupération des variables (paramètre $variable)
RADICAL=$(echo $variable| awk -F'www.' '{print $2}' | awk -F'.' '{print $1}')

#si le radical fait + de 15char ou a des caractères spéciaux

#Création du dossier de deploiement
mkdir $RADICAL\-folder && cd $RADICAL-folder

#Création du nom de l'espace pour le conteneur dédié
kubectl create namespace $RADICAL\-ns

#Création de la ConfigMap selon le dossier spécifié
kubectl create configmap $RADICAL\-cm --from-file=./

#Création du fichier deployment.yaml (qui contiendra également le service.yaml)
cp /home/admuser/template_deployment.yaml deployment.yaml

#modification du fichier deployment.yaml selon les variables
sed -i -e "s/RADICAL/$RADICAL/g" deployment.yaml

#Application du deployment.yaml dans le NAMESPACE spécifié
kubectl apply -n $RADICAL\-ns -f "./deployment.yaml"