CREATE DATABASE VENTE; 
USE VENTE;
CREATE TABLE Utilisateurs (
    ID_utilisateur INT PRIMARY KEY,
    Nom_utilisateur VARCHAR(50),
    Prenom_utilisateur VARCHAR(50),
    Age_utilisateur INT,
    Adresse_utilisateur VARCHAR(100),
    Photo_de_profil_utilisateur VARCHAR(255),
    Mot_de_passe_utilisateur VARCHAR(255), 
    Rôle_utilisateur VARCHAR(50)
);

CREATE TABLE Produits (
    ID_produit INT PRIMARY KEY,
    Nom_produit VARCHAR(100),
    Description_produit TEXT,
    Prix_produit DECIMAL(10, 2),
    Image_produit VARCHAR(255),
    Stock_produit INT
);

CREATE TABLE Commandes (
    ID_commande INT PRIMARY KEY,
    ID_utilisateur INT,
    Date_commande DATE,
    Statut_commande VARCHAR(20),
    FOREIGN KEY (ID_utilisateur) REFERENCES Utilisateurs(ID_utilisateur)
);

CREATE TABLE Detail_Commande (
    ID_detail INT PRIMARY KEY,
    ID_commande INT,
    ID_produit INT,
    Quantite_Commande INT,
    Prix_unitaire_Commande DECIMAL(10, 2),
    FOREIGN KEY (ID_commande) REFERENCES Commandes(ID_commande),
    FOREIGN KEY (ID_produit) REFERENCES Produits(ID_produit)
);

CREATE TABLE Paiements (
    ID_paiement INT PRIMARY KEY,
    ID_commande INT,
    Montant_total_Paiement DECIMAL(10, 2),
    Type_paiement VARCHAR(50),
    FOREIGN KEY (ID_commande) REFERENCES Commandes(ID_commande)
);
