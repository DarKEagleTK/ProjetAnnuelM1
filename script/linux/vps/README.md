# Fonctionnement

on lance le script vps.sh, qui va modifier le fichier de varaibles.
On lance ensuite les commandes terraform apres avoir modifier le fichiers des variables

# lancer terraform avec des variables

```
terraform init
terraform plan -var-file=variables.tf
terraform apply -var-file=variables.tf
```