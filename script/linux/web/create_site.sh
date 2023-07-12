#!/bin/bash

#Variables 
NAMESPACE=""
RADICAL=""
DEPLOY_DIR=""
NB_REPLICAS=""

#Création du dossier de deploiement
mkdir $DEPLOY_DIR && cd $DEPLOY_DIR
cp ../template_deployment.yaml

#Création du nom de l'espace pour le conteneur dédié
kubectl create namespace $NAMESPACE 

#Création de la ConfigMap selon le dossier spécifié
kubectl create configmap $RADICAL\_cm --from-file=./

#Création du fichier deployment.yaml (qui contiendra également le service.yaml)

#Application du deployment.yaml dans le namespace spécifié
kubectl apply -n $NAMESPACE -f "./deployment.yaml"