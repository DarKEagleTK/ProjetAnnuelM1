# Fonctionnement

on lance le script vps qui prends comme parametre l'os, le nom, l'id de la machine virtuelle, le nombre de coeur du processeur, la memoire, l'adresse ip et la cle ssh.

Le script commence par supprimer l'ancien fichier ressources.tf

Il copie ensuite le modele ressources.tf.new, et modifie les parametres par les valeurs donne au script.

Il lance ensuite le terraform