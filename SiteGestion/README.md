# Information

## IP

Plage IP site web : 10.1.5.0/16, gw : 10.1.1.1, dns 10.1.1.1
Plage IP VPS : 10.1.5.0/16, gw : 10.1.1.1, dns 10.1.1.1

## service

- nom de domaine : récupération d'un nom de domaine
- mail : rattacher a un nom de domaine
- VPS : custom
- site web

## Base de données

- utilisateurs
  - tables users : id name password mail
  - tables vps: vmid id_user name os cores memory ip sshkey
  - tables domaine : id id_user domaine
  - tables mail : id id_user mail
  - tables site_web : id id_user site ip
  - tables services : nombre de service existant par utilisateurs (null = pas de services)

