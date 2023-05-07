#Fonctionnement

on lance le script vps.sh, qui va modifier le fichier .tfvars
On lance ensuite les commandes terraform apres avoir modifier le fichiers des variables

# lancer terraform avec des variables

```
terraform init
terraform plan -var-file=variables.tfvars
terraform apply -var-file=variables.tfvars
```