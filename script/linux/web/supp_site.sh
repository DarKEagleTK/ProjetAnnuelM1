#!/bin/bash

# Variables
KUBE_NAMESPACE="default"
DEPLOYMENT_NAME="your-deployment-name"

# Uninstall the Helm release, which will delete the associated Kubernetes resources (including pods)
helm uninstall $DEPLOYMENT_NAME --namespace $KUBE_NAMESPACE
