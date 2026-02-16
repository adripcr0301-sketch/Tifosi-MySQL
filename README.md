Devoir SQL, resaturant Tifosi - Créer une base de données - L'agrémenter de données - Y faire des requètes. 

Démarche de réalisation

Etape 1 : Lecture et compréhension du brief

J'ai commencé par lire le modèle conceptuel fourni par le propriétaire du restaurant. J'ai repéré les différentes entités (ingredient, focaccia, boisson, marque, client, menu), leurs attributs et les relations entre elles.
J'ai fait attention aux cardinalités pour savoir comment traduire chaque relation en tables SQL.

Etape 2 : Mise en place de l'environnement

J'ai lancé WAMP sur ma machine pour disposer d'un serveur MySQL en local. J'ai ensuite ouvert MySQL Workbench pour me connecter au serveur et travailler sur mes scripts.

Etape 3 : Création du schéma de la base

J'ai rédigé le script de création en respectant un ordre logique : d'abord les tables sans dépendances (ingredient, marque, client, focaccia), puis celles qui contiennent des clés étrangères (boisson qui référence marque, menu qui référence focaccia), 
et enfin les tables d'association (comprend, achete, contient). 
J'ai aussi pensé à ajouter les contraintes de sécurité : NOT NULL sur les champs obligatoires, UNIQUE sur les noms et emails, et les clés étrangères pour garantir l'intégrité des données.

Etape 4 : Insertion des données

J'ai ouvert les fichiers Excel fournis (focaccia.xlsx, ingredient.xlsx, boisson.xlsx, marque.xlsx) et j'ai écrit les INSERT correspondants. 
La partie la plus longue a été la table comprend : il fallait croiser la liste des ingrédients de chaque focaccia avec les quantités par défaut en bas du fichier, tout en repérant les quantités spécifiques indiquées entre parenthèses pour certaines recettes.

Etape 5 : Requêtes de vérification

J'ai construit mes requêtes une par une dans Workbench. Pour chacune, j'écrivais le code SQL, je l'exécutais et je vérifiais que le résultat correspondait à ce que j'attendais. 
Sur la requête 7 par exemple, j'avais oublié d'ajouter un LIMIT 1, ce qui affichait toutes les focaccias triées au lieu d'une seule. J'ai noté cet écart et la correction dans mes commentaires.

Etape 6 : Versioning sur GitHub

Une fois les trois scripts finalisés et testés, je les ai push sur un dépôt GitHub propre pour le rendu du projet.
