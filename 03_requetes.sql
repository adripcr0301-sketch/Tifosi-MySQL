-- Requêtes de vérification - Base tifosi
USE tifosi;

-- 1. Liste des focaccias par ordre alphabétique
SELECT nom FROM focaccia ORDER BY nom ASC;
-- Résultat : les 8 focaccias s'affichent bien de A à Z (Américaine -> Tradizione)
-- OK, conforme.

-- 2. Nombre total d'ingrédients
SELECT COUNT(*) AS nombre_ingredients FROM ingredient;
-- Résultat : 25, c'est correct.

-- 3. Prix moyen des focaccias
SELECT ROUND(AVG(prix), 2) AS prix_moyen FROM focaccia;
-- Résultat : 10.38
-- Le calcul à la main donne 10.375, la différence vient de l'arrondi avec ROUND.

-- 4. Liste des boissons avec leur marque, triée par nom de boisson
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;
-- Résultat : 12 lignes, chaque boisson est bien associée à sa marque. OK.

-- 5. Ingrédients de la Raclaccia
SELECT i.nom AS ingredient
FROM ingredient i
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
WHERE f.nom = 'Raclaccia';
-- Résultat : 7 ingrédients (Ail, Base Tomate, Champignon, Cresson, Parmesan, Poivre, Raclette)
-- Ça correspond aux données du fichier Excel.

-- 6. Nom et nombre d'ingrédients par focaccia
SELECT f.nom, COUNT(c.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.nom
ORDER BY f.nom;
-- Résultat :
-- Américaine: 8, Emmentalaccia: 7, Gorgonzollaccia: 8, Hawaienne: 9,
-- Mozaccia: 10, Paysanne: 12, Raclaccia: 7, Tradizione: 9
-- Pas de souci.

-- 7. Focaccia avec le plus d'ingrédients
SELECT f.nom, COUNT(c.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.nom
ORDER BY nb_ingredients DESC;
-- Résultat : la requête retourne toutes les focaccias triées par nombre décroissant
-- au lieu de juste celle avec le plus d'ingrédients.
-- Il manque LIMIT 1 à la fin pour ne garder que la première ligne.
-- Avec LIMIT 1 on obtient bien Paysanne avec 12 ingrédients.

-- 8. Focaccias qui contiennent de l'ail
SELECT DISTINCT f.nom
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';
-- Résultat : Mozaccia, Gorgonzollaccia, Raclaccia, Paysanne. OK.

-- 9. Ingrédients inutilisés (pas dans une focaccia)
SELECT i.nom
FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_ingredient IS NULL;
-- Résultat : Salami et Tomate cerise
-- Ce sont les deux seuls ingrédients qui n'apparaissent dans aucune recette. C'est normal.

-- 10. Focaccias sans champignons
SELECT f.nom
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT c.id_focaccia
    FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
);
-- Résultat : Hawaienne et Américaine. Correct.
