-- Création de la base de données tifosi
DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Création d'un utilisateur dédié avec tous les droits sur la base tifosi
DROP USER IF EXISTS 'tifosi'@'localhost';
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'Tifosi2026!';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

USE tifosi;

-- Table des ingrédients
CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Table des marques de boissons
CREATE TABLE marque (
    id_marque INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Table des clients
CREATE TABLE client (
    id_client INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT
) ENGINE=InnoDB;

-- Table des focaccias
CREATE TABLE focaccia (
    id_focaccia INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL
) ENGINE=InnoDB;

-- Table des boissons
-- Chaque boisson appartient à une seule marque (relation 1,1 côté boisson)
CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    id_marque INT NOT NULL,
    CONSTRAINT fk_boisson_marque FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
) ENGINE=InnoDB;

-- Table des menus
-- Chaque menu est constitué d'une seule focaccia (relation 1,1 côté menu)
CREATE TABLE menu (
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL,
    id_focaccia INT NOT NULL,
    CONSTRAINT fk_menu_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
) ENGINE=InnoDB;

-- Table d'association : comprend (quels ingrédients composent chaque focaccia)
-- Avec la quantité en grammes pour chaque ingrédient
CREATE TABLE comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    CONSTRAINT fk_comprend_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    CONSTRAINT fk_comprend_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
) ENGINE=InnoDB;

-- Table d'association : achete (historique des achats de menus par les clients)
CREATE TABLE achete (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu, date_achat),
    CONSTRAINT fk_achete_client FOREIGN KEY (id_client) REFERENCES client(id_client),
    CONSTRAINT fk_achete_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
) ENGINE=InnoDB;

-- Table d'association : contient (quelles boissons sont dans chaque menu)
CREATE TABLE contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    CONSTRAINT fk_contient_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    CONSTRAINT fk_contient_boisson FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
) ENGINE=InnoDB;
