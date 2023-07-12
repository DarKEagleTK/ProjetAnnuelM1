#!/bin/bash

# Variables
NAMESPACE=""
DEPLOYMENT_NAME=""
SERVICE_NAME=""
CONFIGMAP_NAME=""
DEPLOY_DIR=""

#Désinstallation de déploiement
kubectl delete -n $NAMESPACE deployment $DEPLOYMENT_NAME
kubectl delete -n $NAMESPACE services $SERVICE_NAME
kubectl delete -n $NAMESPACE cm $CONFIGMAP_NAME
kubectl delete $NAMESPACE

#Suppression du dossier de conteneur
sudo rm -r $DEPLOY_DIR
