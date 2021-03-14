# Regroupement 00q7
* [Auteur](#auteur)
* [Liste des fichiers](#liste-des-fichiers)
* [Création de la base de données](#création-de-la-base-de-données)
    * [Pré-requis](#pré-requis)
    * [Démarrage rapide](#démarrage-rapide)
    * [Étape par étape](#étape-par-étape)
        1. [Créer la base de données](#créer-la-base-de-données)
        2. [Remplir la base de données](#remplir-la-base-de-données)
* [Effacer la base de données](#effacer-la-base-de-données)
* [Archiver la base de données](#archiver-la-base-de-données)

## Auteur
Pierre Tremblay-Thériault  
pierre@lapinchatware.ca

## Liste des fichiers

- Modèle de données
  ```
  modele/diagramHigh.png
  ```
- Scripts de création/gestion de la base de données incluant :
    - Les tables et les relations
      ```
      create_db/schema.sql
      ```
    - Les contraintes d’intégrité référentielle
      ```
      create_db/schema.sql
      ```
    - Les autorisations
      ```
      create_db/users.sql
      ```
- Requêtes d’insertion, de modification et de sélection
  ```
  create_db/procedures.sql
  ```
  ```
  data_demo/outputs/insert_addresstypes.sql
  data_demo/outputs/insert_country.sql
  data_demo/outputs/insert_logpartactions.sql
  data_demo/outputs/insert_parttypes.sql
  data_demo/outputs/insert_permissions.sql
  data_demo/outputs/insert_roles.sql
  data_demo/outputs/insert_users.sql
  data_demo/outputs/insert_states.sql
  data_demo/outputs/insert_addresses.sql
  data_demo/outputs/insert_address_addresstypes.sql
  data_demo/outputs/insert_locations.sql
  data_demo/outputs/insert_quadcopters.sql
  data_demo/outputs/insert_logflights.sql
  data_demo/outputs/insert_part_antennas.sql
  data_demo/outputs/insert_part_cameras.sql
  data_demo/outputs/insert_part_ESCs.sql
  data_demo/outputs/insert_part_flight_controllers.sql
  data_demo/outputs/insert_part_frames.sql
  data_demo/outputs/insert_part_GPSs.sql
  data_demo/outputs/insert_part_motors.sql
  data_demo/outputs/insert_part_PDBs.sql
  data_demo/outputs/insert_part_props.sql
  data_demo/outputs/insert_part_radio_receivers.sql
  data_demo/outputs/insert_part_video_transmitters.sql
  data_demo/outputs/insert_part_voltage_regulators.sql
  data_demo/outputs/insert_part_voltage_sensors.sql
  data_demo/outputs/insert_logparts.sql
  data_demo/outputs/insert_roles_permissions.sql
  data_demo/outputs/insert_user_addresses.sql
  data_demo/outputs/insert_user_roles.sql
  ```
- Script ou procédure stocké
  ```
  create_db/procedures.sql
  ```
- Sauvegarde de la base de données (structure de la base de données et les données)
  ```
  db_dump/sauvegarde.sql
  ```
- Rapport statistique créé avec le chiffrier électronique incluant l’analyse des résultats et le graphique.
  ```
  analyses/analyses.xlsx
  ```

## Création de la base de données

### Pré-requis

- MariaDB 15.1 (très probablement compatible MySQL)

### Démarrage rapide

`mysql_username` = nom d'utilisateur de votre installation mysql/mariadb

```
sh regroupement00q7 -u [mysql_username] -r create_from_dump -f db_dump/sauvegarde.sql
```

### Étape par étape

#### Créer la base de données

`mysql_username` = nom d'utilisateur de votre installation mysql/mariadb

```
sh regroupement00q7 -u [mysql_username] -r create
```

#### Remplir la base de données

`mysql_username` = nom d'utilisateur de votre installation mysql/mariadb

```
sh regroupement00q7 -u [mysql_username] -r add_data
```

## Effacer la base de données

`mysql_username` = nom d'utilisateur de votre installation mysql/mariadb

```
sh regroupement00q7 -u [mysql_username] -r drop
```

## Archiver la base de données

`mysql_username` = nom d'utilisateur de votre installation mysql/mariadb
`dump_filename` = chemin et nom du fichier de l'archive

```
sh regroupement00q7 -u [mysql_username] -r dump -f [dump_filename]
```