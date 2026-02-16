-- Script de vérification de la base de données tifosi
-- 10 requêtes de test pour valider le contenu et la structure
USE tifosi;

-- =============================================
-- Requête 1 : Afficher la liste des noms des focaccias par ordre alphabétique croissant
-- =============================================
-- Résultat attendu : les 8 focaccias triées de A à Z
SELECT nom FROM focaccia ORDER BY nom ASC;
-- Résultat obtenu :
-- Américaine
-- Emmentalaccia
-- Gorgonzollaccia
-- Hawaienne
-- Mozaccia
-- Paysanne
-- Raclaccia
-- Tradizione
-- Pas d'écart constaté.

-- =============================================
-- Requête 2 : Afficher le nombre total d'ingrédients
-- =============================================
-- Résultat attendu : 25 ingrédients au total
SELECT COUNT(*) AS nombre_ingredients FROM ingredient;
-- Résultat obtenu : 25
-- Pas d'écart constaté.

-- =============================================
-- Requête 3 : Afficher le prix moyen des focaccias
-- =============================================
-- Résultat attendu : moyenne des prix (9.80+10.80+8.90+9.80+8.90+11.20+10.80+12.80) / 8 = 10.375
SELECT ROUND(AVG(prix), 2) AS prix_moyen FROM focaccia;
-- Résultat obtenu : 10.38
-- Léger écart dû à l'arrondi : le calcul exact donne 10.375, arrondi à 10.38 avec ROUND.

-- =============================================
-- Requête 4 : Afficher la liste des boissons avec leur marque, triée par nom de boisson
-- =============================================
-- Résultat attendu : les 12 boissons avec le nom de leur marque, triées alphabétiquement
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;
-- Résultat obtenu :
-- Capri-sun          | Coca-cola
-- Coca-cola original | Coca-cola
-- Coca-cola zéro     | Coca-cola
-- Eau de source      | Cristalline
-- Fanta citron       | Coca-cola
-- Fanta orange       | Coca-cola
-- Lipton Peach       | Pepsico
-- Lipton zéro citron | Pepsico
-- Monster energy ultra blue | Monster
-- Monster energy ultra gold | Monster
-- Pepsi              | Pepsico
-- Pepsi Max Zéro     | Pepsico
-- Pas d'écart constaté.

-- =============================================
-- Requête 5 : Afficher la liste des ingrédients pour une Raclaccia
-- =============================================
-- Résultat attendu : les 7 ingrédients de la Raclaccia
SELECT i.nom AS ingredient
FROM ingredient i
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
WHERE f.nom = 'Raclaccia';
-- Résultat obtenu :
-- Ail
-- Base Tomate
-- Champignon
-- Cresson
-- Parmesan
-- Poivre
-- Raclette
-- Pas d'écart constaté.

-- =============================================
-- Requête 6 : Afficher le nom et le nombre d'ingrédients pour chaque focaccia
-- =============================================
-- Résultat attendu : chaque focaccia avec son nombre d'ingrédients
SELECT f.nom, COUNT(c.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.nom
ORDER BY f.nom;
-- Résultat obtenu :
-- Américaine      | 8
-- Emmentalaccia   | 7
-- Gorgonzollaccia | 8
-- Hawaienne       | 9
-- Mozaccia        | 10
-- Paysanne        | 12
-- Raclaccia       | 7
-- Tradizione      | 9
-- Pas d'écart constaté.

-- =============================================
-- Requête 7 : Afficher le nom de la focaccia qui a le plus d'ingrédients
-- =============================================
-- Résultat attendu : Paysanne (12 ingrédients)
SELECT f.nom, COUNT(c.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.nom
ORDER BY nb_ingredients DESC;
-- Résultat obtenu : la requête affiche toutes les focaccias triées par nombre d'ingrédients décroissant,
-- au lieu d'afficher uniquement celle qui en a le plus.
-- Ecart : il manque un LIMIT 1 à la fin de la requête pour ne récupérer que la première ligne.
-- En ajoutant LIMIT 1, on obtient bien : Paysanne | 12

-- =============================================
-- Requête 8 : Afficher la liste des focaccias qui contiennent de l'ail
-- =============================================
-- Résultat attendu : les focaccias ayant de l'ail dans leur composition
SELECT DISTINCT f.nom
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';
-- Résultat obtenu :
-- Mozaccia
-- Gorgonzollaccia
-- Raclaccia
-- Paysanne
-- Pas d'écart constaté.

-- =============================================
-- Requête 9 : Afficher la liste des ingrédients inutilisés
-- =============================================
-- Résultat attendu : les ingrédients qui ne sont dans aucune focaccia
SELECT i.nom
FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_ingredient IS NULL;
-- Résultat obtenu :
-- Salami
-- Tomate cerise
-- Pas d'écart constaté. Ces deux ingrédients existent dans la table mais ne sont utilisés dans aucune recette.

-- =============================================
-- Requête 10 : Afficher la liste des focaccias qui n'ont pas de champignons
-- =============================================
-- Résultat attendu : les focaccias sans champignon dans leur composition
SELECT f.nom
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT c.id_focaccia
    FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
);
-- Résultat obtenu :
-- Hawaienne
-- Américaine
-- Pas d'écart constaté.
