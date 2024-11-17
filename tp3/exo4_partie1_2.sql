CREATE TABLE DIM_PRODUIT (
    id_produit INT PRIMARY KEY,
    nom_produit VARCHAR(255),
    categorie VARCHAR(255),
    prix_vente DECIMAL(10, 2)
);

CREATE TABLE DIM_MAGASIN (
    id_magasin INT PRIMARY KEY,
    nom_magasin VARCHAR(255),
    telephone VARCHAR(20),
    ville VARCHAR(255),
    region VARCHAR(255)
);

CREATE TABLE DIM_TEMPS (
    id_temps INT PRIMARY KEY,
    mois INT,
    trimestre INT,
    annee INT
);

CREATE TABLE Fait_Vente (
    id_produit INT,
    id_magasin INT,
    id_temps INT,
    qte_vendue INT,
    montant DECIMAL(10, 2),
    PRIMARY KEY (id_produit, id_magasin, id_temps),
    FOREIGN KEY (id_produit) REFERENCES DIM_PRODUIT(id_produit),
    FOREIGN KEY (id_magasin) REFERENCES DIM_MAGASIN(id_magasin),
    FOREIGN KEY (id_temps) REFERENCES DIM_TEMPS(id_temps)
);

COMMIT;