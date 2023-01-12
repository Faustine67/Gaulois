*/ Nom des lieux qui finissent pas 'um' */
SELECT * FROM lieu
WHERE nom_lieu LIKE "%um";

/* Nombre de personnage par lieu (trier par nombre de personnage decroissant) */ 

SELECT COUNT(id_personnage) ,id_lieu
FROM personnage
GROUP BY id_lieu
