/* Nom des lieux qui finissent pas 'um' */
SELECT * FROM lieu
WHERE nom_lieu LIKE "%um";

/* Nombre de personnage par lieu (trier par nombre de personnage decroissant) */ 
SELECT COUNT(id_personnage) ,id_lieu
FROM personnage
GROUP BY id_lieu

/*Nom des personnages + spécialité + adresse et lieu d'habitation, triés par lieu puis par nom
de personnage */
SELECT nom_personnage,nom_specialite,adresse_personnage,nom_lieu
FROM personnage
INNER JOIN specialite ON personnage.id_specialite =specialite.id_specialite
INNER JOIN lieu ON personnage.id_lieu= lieu.id_lieu

 /*Nom des spécialités avec nombre de personnages par spécialité (trié par nombre de 
personnages décroissant). */
SELECT nom_specialite, COUNT(id_personnage)
FROM specialite
INNER JOIN personnage ON specialite.id_specialite=personnage.id_specialite
GROUP BY specialite.nom_specialite ORDER BY COUNT(id_personnage) DESC

/*Nom, date et lieu des batailles, classées de la plus récente à la plus ancienne (dates affichées 
au format jj/mm/aaaa). */
SELECT nom_bataille, DATE_FORMAT(date_bataille,"%d %m -%Y")AS date_bataille, nom_lieu
FROM bataille
INNER JOIN lieu ON bataille.id_lieu=lieu.id_lieu
ORDER BY YEAR(date_bataille) DESC 

/*Nom des potions + coût de réalisation de la potion (trié par coût décroissant). */
 SELECT nom_potion, SUM(qte*cout_ingredient)
 FROM potion
 INNER JOIN composer ON potion.id_potion = composer.id_potion
 INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient
 GROUP BY potion.nom_potion

 /*Nom des ingrédients + coût + quantité de chaque ingrédient qui composent la potion 'Santé' */
 SELECT nom_ingredient, cout_ingredient,qte
 FROM ingredient
 INNER JOIN composer ON ingredient.id_ingredient= composer.id_ingredient
 INNER JOIN potion ON composer.id_potion= potion.id_potion
 WHERE LOWER(nom_potion) LIKE 'santé'
 
  /* Nom du ou des personnages qui ont pris le plus de casques dans la bataille 'Bataille du village 
gaulois' */
SELECT nom_personnage, qte
FROM personnage
INNER JOIN prendre_casque ON personnage.id_personnage= prendre_casque.id_personnage
INNER JOIN bataille ON prendre_casque.id_bataille= bataille.id_bataille
WHERE (nom_bataille) LIKE 'Bataille du village gaulois'
ORDER BY (qte) DESC
LIMIT 1

/*Nom des personnages et leur quantité de potion bue (en les classant du plus grand buveur 
au plus petit). */
SELECT nom_personnage, SUM(dose_boire) AS 'qtt totale bue'
FROM personnage
INNER JOIN boire ON personnage.id_personnage = boire.id_personnage
GROUP BY personnage.nom_personnage
ORDER BY SUM(dose_boire) DESC 

/*Nom de la bataille où le nombre de casques pris a été le plus important */
SELECT nom_bataille, SUM(qte) AS 'qtt totale casque'
FROM bataille
INNER JOIN prendre_casque ON bataille.id_bataille=prendre_casque.id_bataille
GROUP BY bataille.nom_bataille
ORDER BY SUM(qte) DESC
LIMIT 1

/* Combien existe-t-il de casques de chaque type et quel est leur coût total ? (classés par 
nombre décroissant)? */
SELECT nom_type_casque, SUM(casque.cout_casque) AS cout
FROM type_casque
INNER JOIN casque ON type_casque.id_type_casque=casque.id_type_casque
GROUP BY type_casque.id_type_casque
ORDER BY cout DESC

/* Nom des potions dont un des ingredients est le poisson frais */
SELECT nom_potion
FROM potion
INNER JOIN composer ON potion.id_potion=potion.id_potion
INNER JOIN ingredient ON composer.id_ingredient= composer.id_ingredient
WHERE LOWER(nom_ingredient) LIKE 'poisson frais'
GROUP BY potion.nom_potion
