#!/bin/bash

# Variables
KUBE_NAMESPACE="default"
WEB_SERVER_SSH_USER="webserver-ssh-user"
WEB_SERVER_IP="webserver-ip"
WEB_SERVER_SITE_FOLDER="/var/www/sites"

# Deploy each site using Helm
sites=("site1" "site2" "site3")

for site in "${sites[@]}"; do
  # Copy the Helm chart for the site to the server
  scp -r "$site" $WEB_SERVER_SSH_USER@$WEB_SERVER_IP:$WEB_SERVER_SITE_FOLDER/

  # Install the Helm chart on the Kubernetes cluster
  helm upgrade --install $site $site/ --namespace $KUBE_NAMESPACE --values $site/values.yaml
done
