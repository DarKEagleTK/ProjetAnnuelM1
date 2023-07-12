#!/bin/bash

#Récupération/demande des variables
if [ "$#" -ne 4 ]; then
    echo "Variables : namespace radical deploy_dir nb_replica"
    exit 1
fi

#Variables 
NAMESPACE=$1
RADICAL=$2
DEPLOY_DIR=$3
NB_REPLICAS=$4

#Création du dossier de deploiement
mkdir $DEPLOY_DIR && cd $DEPLOY_DIR

#Création du nom de l'espace pour le conteneur dédié
kubectl create namespace $NAMESPACE 

#Création de la ConfigMap selon le dossier spécifié
kubectl create configmap $RADICAL\_cm --from-file=./

#Création du fichier deployment.yaml (qui contiendra également le service.yaml)
cp ../template_deployment.yaml deployment.yaml

#modification du fichier deployment.yaml selon les variables
sed -i -e "s/RADICAL/$RADICAL/g" deployment.yaml
sed -i -e "s/NB_REPLICAS/$NB_REPLICAS/g" deployment.yaml

#Application du deployment.yaml dans le namespace spécifié
kubectl apply -n $NAMESPACE -f "./deployment.yaml"