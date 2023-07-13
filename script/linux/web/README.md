Le fichier create.sh/create_site.sh prends les fichiers donnée par le client stocké dans /tmp/
Il crée un dossier spécifique à chaque conteneur et créer le déploiement avec le service LB pour accéder au site en externe

Le fichier suppr.sh/supp_site.sh supprime un déploiement avec tous les paramètres lui correspondant ainsi que le dossier comprenant le contenu du site

Une copie des scripts effectué tout le long du projet est stocké dans :
    - Abandon : scripts utilisés et abandonné
    - Test : fichier et scripts des tests effectué pour créer des conteneurs
    - template_deployment.yaml