CREATE SCHEMA `polyforum` ;

CREATE TABLE polyforum.entreprise
(
id_entreprise int NOT NULL AUTO_INCREMENT,
nom varchar(32) not null,
nom_representant varchar(32),
present boolean,
login varchar(32),
password varchar(32),
PRIMARY KEY (id_entreprise)
);

CREATE TABLE polyforum.candidat
(
id_candidat int not null AUTO_INCREMENT,
nom varchar(32) not null,
prenom varchar(32),
trouve boolean,
present boolean,
login varchar(32),
password varchar(32),
PRIMARY KEY(id_candidat)
);

CREATE TABLE polyforum.entretien
(
id_entreprise int not null,
id_candidat int not null,
heure time not null,
heure_fin time not null,
id_salle varchar(32),
present boolean, 
retard boolean,
PRIMARY KEY(id_entreprise, id_candidat)
);

CREATE TABLE polyforum.salle
(
id_salle int not null AUTO_INCREMENT,
disponible boolean,
capacite int not null,
capacite_totale int not null,
PRIMARY KEY(id_salle)
);

CREATE TABLE polyforum.choix_candidat
(
id_candidat int not null,
id_entreprise int not null,
priorite int not null,
PRIMARY KEY(id_candidat, id_entreprise)
);

CREATE TABLE polyforum.choix_entreprise
(
id_entreprise int not null,
id_candidat int not null,
temps_voulu int not null,
priorite int not null,
PRIMARY KEY(id_entreprise, id_candidat)
)