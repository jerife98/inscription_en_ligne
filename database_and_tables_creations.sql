DROP DATABASE IF EXISTS ecole;
CREATE DATABASE ecole CHARACTER SET 'utf8';

USE ecole;

-- Création de la table Etudiants
DROP TABLE IF EXISTS Etudiants;
CREATE TABLE Etudiants(
        id_etudiant     int (25) Auto_increment not null,
        nom     Varchar (50) not null,
        prenom     Varchar (50) not null,
        date_naissance     Date not null,
        email     Varchar (50) not null,
        telephone     Varchar (50) not null,
        date_inscription     Date not null,
        PRIMARY KEY (id_etudiant)
)ENGINE=InnoDB;

-- Création de la table Formations
DROP TABLE IF EXISTS Formations;
CREATE TABLE Formations(
        id_formation     int (25) Auto_increment not null,
        nom_formation     Varchar (50) not null,
        description     Text (2000),
        date_debut     Date not null,
        date_fin     Date not null,
        tarif     Real unsigned not null,
        nombre_places int (50),
        PRIMARY KEY (id_formation)
)ENGINE=InnoDB;

-- Création de la table Inscriptions
DROP TABLE IF EXISTS Inscriptions;
CREATE TABLE Inscriptions(
        id_inscription     int (25) auto_increment not null,
        date_inscription     Date not null,
        statut_paiement     Bool not null,
        id_etudiant_Etudiants  int not null,
        id_formation_Formations int not null,
        PRIMARY KEY (id_inscription),
        FOREIGN KEY (id_etudiant_Etudiants) REFERENCES Etudiants(id_etudiant),
        FOREIGN KEY (id_formation_Formations) REFERENCES Formations(id_formation)
)ENGINE=InnoDB;

-- Création de la table Paiements
DROP TABLE IF EXISTS Paiements;
CREATE TABLE Paiements(
        id_paiement     int (50) Auto_increment not null,
        montant     Float (50) not null,
        date_paiement     Date not null,
        methode_paiement     Varchar (50) not null,
        id_inscription_Inscriptions int not null,
        PRIMARY KEY (id_paiement),
        FOREIGN KEY (id_inscription_Inscriptions) REFERENCES Inscriptions(id_inscription)
)ENGINE=InnoDB;

