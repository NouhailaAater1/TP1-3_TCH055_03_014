INSERT INTO Client(id_client, nom_client, prenom_client, adresse_client, 
                            no_telephone_client, nb_emprunt, type_client)
VALUES(4 , 'Aater' , 'Nouhaila' , '1250 rue Maisonneuve', 45251674581, 2, 'O');

INSERT INTO Magasin_De_Location(id_magasin, adresse_magasin, nom_magasin)
VALUES(4 , '3245 rue Lavoix' , 'Meilleur magasin');

INSERT INTO Film(id_film, titre_film, date_parution, duree_film)
VALUES(6 , 'Blanche neige' , '2021-06-15' , 120 );

INSERT INTO  Note(id_note, note, id_client, id_film)
VALUES(8 , 0 , 4 , 6 );

INSERT INTO  DVD(id_dvd, etat_dvd_actuel, date_mise_en_service, id_magasin, id_film)
VALUES(8 , 'Bien' , '2021-08-24' , 4 , 6);

INSERT INTO  Emprunt(id_emprunt, date_emprunt, date_retour, 
            etat_dvd_emprunt, etat_dvd_retour, id_client, id_dvd)
VALUES(8 , '2021-09-17' , '2021-09-27' , 'Parfait' ,'Parfait' , 4 , 8 );

INSERT INTO  Facture(id_facture, id_emprunt, montant_facture, date_emprunt, id_client)
VALUES(9 , 8 , 6 , '2021-09-17', 4 );

INSERT INTO Caution(id_caution, nb_dvd, montant_caution, id_emprunt)
VALUES(10, 3 , 6 , 8 );

INSERT INTO DVD_Magasin_De_Location(Magasin_De_Location_id_magasin, Film_id_film)
VALUES( 4 , 6 );

INSERT INTO Realisateur(id_realisateur, nom_realisateur, prenom_realisateur)
VALUES( 1 , 'Hand' , 'David' );

INSERT INTO Realisateur_Film(Realisateurid_realisateur, Filmid_film)
VALUES( 1 , 6 );

INSERT INTO Genre(nom_genre, type_public)
VALUES('fantasy' , 'famille');

INSERT INTO Genre_Film(Genrenom_genre, Filmid_film)
VALUES('fantasy' , 6);

INSERT INTO Acteurs_principaux(id_acteur, nom_acteur, prenom_acteur)
VALUES(3, 'Caselotti' , 'Adriana');

INSERT INTO Acteurs_principaux_Film(Acteurs_principauxid_acteur, Filmid_film)
VALUES(3 , 6);