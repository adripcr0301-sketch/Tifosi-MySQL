-- Script d'insertion des données de test dans la base tifosi
USE tifosi;

-- Insertion des ingrédients
INSERT INTO ingredient (id_ingredient, nom) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');

-- Insertion des marques
INSERT INTO marque (id_marque, nom) VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- Insertion des focaccias
INSERT INTO focaccia (id_focaccia, nom, prix) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 8.90),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);

-- Insertion des boissons (chaque boisson est liée à sa marque)
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES
(1, 'Coca-cola zéro', 1),
(2, 'Coca-cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri-sun', 1),
(6, 'Pepsi', 4),
(7, 'Pepsi Max Zéro', 4),
(8, 'Lipton zéro citron', 4),
(9, 'Lipton Peach', 4),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source', 2);

-- Insertion de la composition des focaccias (table comprend)
-- Les quantités sont en grammes, issues du fichier focaccia.xlsx

-- Mozaccia
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
(1, 5, 200),   -- Base Tomate
(1, 25, 50),   -- Mozarella
(1, 9, 20),    -- Cresson
(1, 13, 80),   -- Jambon fumé
(1, 1, 2),     -- Ail
(1, 3, 20),    -- Artichaut
(1, 7, 40),    -- Champignon
(1, 18, 50),   -- Parmesan
(1, 20, 1),    -- Poivre
(1, 16, 20);   -- Olive noire

-- Gorgonzollaccia
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
(2, 5, 200),   -- Base Tomate
(2, 11, 50),   -- Gorgonzola
(2, 9, 20),    -- Cresson
(2, 1, 2),     -- Ail
(2, 7, 40),    -- Champignon
(2, 18, 50),   -- Parmesan
(2, 20, 1),    -- Poivre
(2, 16, 20);   -- Olive noire

-- Raclaccia
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
(3, 5, 200),   -- Base Tomate
(3, 22, 50),   -- Raclette
(3, 9, 20),    -- Cresson
(3, 1, 2),     -- Ail
(3, 7, 40),    -- Champignon
(3, 18, 50),   -- Parmesan
(3, 20, 1);    -- Poivre

-- Emmentalaccia
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
(4, 6, 200),   -- Base crème
(4, 10, 50),   -- Emmental
(4, 9, 20),    -- Cresson
(4, 7, 40),    -- Champignon
(4, 18, 50),   -- Parmesan
(4, 20, 1),    -- Poivre
(4, 15, 20);   -- Oignon

-- Tradizione (quantités spécifiques pour certains ingrédients)
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
(5, 5, 200),   -- Base Tomate
(5, 25, 50),   -- Mozarella
(5, 9, 20),    -- Cresson
(5, 12, 80),   -- Jambon cuit
(5, 7, 80),    -- Champignon (80g au lieu de 40g par défaut)
(5, 18, 50),   -- Parmesan
(5, 20, 1),    -- Poivre
(5, 16, 10),   -- Olive noire (10g au lieu de 20g)
(5, 17, 10);   -- Olive verte (10g au lieu de 20g)

-- Hawaienne
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
(6, 5, 200),   -- Base Tomate
(6, 25, 50),   -- Mozarella
(6, 9, 20),    -- Cresson
(6, 4, 80),    -- Bacon
(6, 2, 40),    -- Ananas
(6, 19, 2),    -- Piment
(6, 18, 50),   -- Parmesan
(6, 20, 1),    -- Poivre
(6, 16, 20);   -- Olive noire

-- Américaine
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
(7, 5, 200),   -- Base Tomate
(7, 25, 50),   -- Mozarella
(7, 9, 20),    -- Cresson
(7, 4, 80),    -- Bacon
(7, 21, 40),   -- Pomme de terre (40g au lieu de 80g)
(7, 18, 50),   -- Parmesan
(7, 20, 1),    -- Poivre
(7, 16, 20);   -- Olive noire

-- Paysanne
INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
(8, 6, 200),   -- Base crème
(8, 8, 50),    -- Chèvre
(8, 9, 20),    -- Cresson
(8, 21, 80),   -- Pomme de terre
(8, 13, 80),   -- Jambon fumé
(8, 1, 2),     -- Ail
(8, 3, 20),    -- Artichaut
(8, 7, 40),    -- Champignon
(8, 18, 50),   -- Parmesan
(8, 20, 1),    -- Poivre
(8, 16, 20),   -- Olive noire
(8, 14, 50);   -- Oeuf
