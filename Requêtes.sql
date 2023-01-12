*/ Nom des lieux qui finissent pas 'um' */
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
