DROP TABLE Note;
DROP TABLE Caution;
DROP TABLE Facture;
DROP TABLE Emprunt;
DROP TABLE DVD_Magasin_De_Location;
DROP TABLE Realisateur_Film;
DROP TABLE Genre_Film;
DROP TABLE Acteurs_principaux_Film;
DROP TABLE DVD;

DROP TABLE Client;
DROP TABLE Magasin_De_Location;
DROP TABLE Film;
DROP TABLE Realisateur;
DROP TABLE Genre;
DROP TABLE Acteurs_principaux;



CREATE TABLE Client(
	id_client 					NUMBER(10)      PRIMARY KEY,
	nom_client					VARCHAR2(50) 	NOT NULL,
	prenom_client				VARCHAR2(50)	NOT NULL, 
	adresse_client				VARCHAR2(100)	NOT NULL,
	no_telephone_client			NUMBER(11)		NOT NULL,
	nb_emprunt					NUMBER(1) 		CHECK(nb_emprunt <=8 and nb_emprunt>=0),
                                                    -- O : vieux client et N : nouveau client
    type_client 				VARCHAR2(1)		CHECK(type_client = 'O' OR type_client = 'N')
);

CREATE TABLE Magasin_De_Location(
    id_magasin      NUMBER(10)      PRIMARY KEY,
    adresse_magasin VARCHAR2(255)   NOT NULL,
    nom_magasin     VARCHAR2(255)   NOT NULL
);

CREATE TABLE Film(
	id_film         NUMBER(10)      PRIMARY KEY,
	titre_film      VARCHAR2(255)   NOT NULL,
	date_parution   DATE            NOT NULL,
	duree_film      NUMBER(3)       NOT NULL
);

CREATE TABLE Note(
	id_note						NUMBER(10),
	note 						number(3) CHECK(note >= 0 AND note <= 100),				
	id_client					NUMBER(10),
	id_film						NUMBER(10),
	PRIMARY KEY (id_note),
	FOREIGN KEY (id_client)		REFERENCES Client(id_client),
	FOREIGN KEY (id_film)		REFERENCES Film(id_film) 
);

CREATE TABLE DVD(
    id_dvd                  NUMBER(10) PRIMARY KEY,
    etat_dvd_actuel         VARCHAR2(20) NOT NULL,
    date_mise_en_service    DATE NOT NULL,
    id_magasin              NUMBER(10)
                    REFERENCES Magasin_De_Location(id_magasin),
    id_film                 NUMBER(10)
                    REFERENCES Film(id_film)
);

CREATE TABLE Emprunt(
	id_emprunt					NUMBER(10),
	date_emprunt				DATE			NOT NULL,
	date_retour 				DATE,
	etat_dvd_emprunt			VARCHAR2(20)	NOT NULL,                     
	etat_dvd_retour				VARCHAR2(20),
	id_client					NUMBER(10),
	id_dvd						NUMBER(10),
	PRIMARY KEY (id_emprunt),
	FOREIGN KEY (id_client)		REFERENCES Client(id_client),
	FOREIGN KEY (id_dvd) 		REFERENCES DVD(id_dvd)
);

CREATE TABLE Facture(
	id_facture					NUMBER(10),
	id_emprunt					NUMBER(10),
	montant_facture				NUMBER(2,0) 	NOT NULL CHECK(montant_facture>=0),
	date_emprunt				DATE			NOT NULL,
	id_client					NUMBER(10),
	PRIMARY KEY (id_facture),
	FOREIGN KEY (id_emprunt) 	REFERENCES Emprunt(id_emprunt),
	FOREIGN KEY (id_client) 	REFERENCES Client(id_client) 
);

CREATE TABLE Caution(
	id_caution					NUMBER(10),
	nb_dvd						NUMBER(1)       NOT NULL CHECK(nb_dvd >=0 AND nb_dvd<=8),
	montant_caution				NUMBER(2,0) 	NOT NULL CHECK(montant_caution >=0 AND montant_caution <=16),
	id_emprunt					NUMBER(10)		NULL,
	PRIMARY KEY (id_caution),
	FOREIGN KEY (id_emprunt) 	REFERENCES Emprunt(id_emprunt)
);

CREATE TABLE DVD_Magasin_De_Location(
    Magasin_De_Location_id_magasin  NUMBER(10)      UNIQUE NOT NULL
                    REFERENCES Magasin_De_Location(id_magasin) ,
    Film_id_film                    NUMBER(10)      UNIQUE NOT NULL
                    REFERENCES Film(id_film)
);

CREATE TABLE Realisateur
(
	id_realisateur      NUMBER(10)       PRIMARY KEY,
	nom_realisateur     VARCHAR2(100)    NOT NULL,
	prenom_realisateur  VARCHAR2(100)    NOT NULL
);

CREATE TABLE Realisateur_Film
(
	Realisateurid_realisateur        NUMBER(10)      UNIQUE NOT NULL,
	Filmid_film                      NUMBER(10)      UNIQUE NOT NULL,
	FOREIGN KEY (Realisateurid_realisateur)          REFERENCES Realisateur(id_realisateur),  
	FOREIGN KEY (Filmid_film)                        REFERENCES Film(id_film)
);

CREATE TABLE Genre
(
	nom_genre      VARCHAR2(100)        PRIMARY KEY,
	type_public    VARCHAR2(100)        NOT NULL
);

CREATE TABLE Genre_Film
(
	Genrenom_genre      VARCHAR2(100)   UNIQUE NOT NULL,
	Filmid_film         NUMBER(3)       UNIQUE NOT NULL,
	FOREIGN KEY (Genrenom_genre)        REFERENCES Genre(nom_genre),  
	FOREIGN KEY (Filmid_film)           REFERENCES Film(id_film)
);

CREATE TABLE Acteurs_principaux
(
	id_acteur      NUMBER(10)       PRIMARY KEY,
	nom_acteur     VARCHAR2(100)    NOT NULL,
	prenom_acteur  VARCHAR2(100)    NOT NULL
);

CREATE TABLE Acteurs_principaux_Film
(
	Acteurs_principauxid_acteur      NUMBER(10)     UNIQUE NOT NULL,
	Filmid_film                      NUMBER(10)     UNIQUE NOT NULL,
	FOREIGN KEY (Acteurs_principauxid_acteur)           REFERENCES Acteurs_principaux(id_acteur),  
	FOREIGN KEY (Filmid_film)                           REFERENCES Film(id_film)
);
