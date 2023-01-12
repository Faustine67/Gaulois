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
 SELECT nom_potion, (qte*cout_ingredient)
 FROM potion
 INNER JOIN composer
