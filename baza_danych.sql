DROP DATABASE IF EXISTS baza_danych;

CREATE DATABASE baza_danych;

USE baza_danych;

CREATE TABLE wojewodztwa 
(kod_w	char(3) not null,
 PRIMARY KEY (kod_w),
 wojewodztwo varchar(30) not null
);

INSERT INTO wojewodztwa (kod_w, wojewodztwo)
VALUES ('dol', 'dolnośląskie'), ('kuj', 'kujawsko-pomorskie'), ('lub','lubelskie'), ('lue','lubuskie'), ('lod','łódzkie'), ('mal','małopolskie'), ('maz','mazowieckie'), ('opo','opolskie'), ('pod','podkarpackie'), ('pol','podlaskie'), ('pom','pomorskie'), ('sla','śląskie'), ('swi','świętokrzyskie'), ('war','warmińsko-mazurskie'), ('wie','wielkopolskie'), ('zac','zachodniopomorskie');

CREATE TABLE miasta 
(id_miasta 	int not null AUTO_INCREMENT, primary key(id_miasta),
 kod_w char(3) not null,
	foreign key (kod_w) references wojewodztwa(kod_w),
	nazwa 		varchar(30) not null
);

INSERT INTO miasta (kod_w, nazwa) VALUES ('maz', 'Wesoła');

SET @id_wes = LAST_INSERT_ID();

INSERT INTO miasta (kod_w, nazwa) VALUES ('maz', 'Warszawa');

SET @id_wwa = LAST_INSERT_ID();

INSERT INTO miasta (kod_w, nazwa) VALUES ('pom', 'Gdańsk');

SET @id_gda = LAST_INSERT_ID();

INSERT INTO miasta (kod_w, nazwa) VALUES ('pom', 'Sopot');

SET @id_sop = LAST_INSERT_ID();

CREATE TABLE osoby 
(	id_osoby	int 		not null AUTO_INCREMENT,
	primary key (id_osoby),
	id_miasta	int 		not null,
	foreign key (id_miasta) references miasta(id_miasta),
	imie		varchar(20) 	not null,
	nazwisko	varchar(30) 	not null
);

CREATE TABLE firmy 
(	nazwa_skr	char(4) 	not null
,	primary key (nazwa_skr)
,	id_miasta	int 		not null
,	foreign key (id_miasta) references miasta(id_miasta)
,	nazwa		varchar(60) 	not null
,	kod_pocztowy	char(6)		not null
,	ulica		varchar(60)	not null
);

INSERT INTO osoby (imie, nazwisko, id_miasta) VALUES ('Maciej', 'Stodolski', @id_wes);

SET @id_ms =  LAST_INSERT_ID();

INSERT INTO osoby (imie, nazwisko, id_miasta) VALUES ('Jacek', 'Korytkowski', @id_wwa);

SET @id_jk =  LAST_INSERT_ID();

INSERT INTO osoby (imie, nazwisko, id_miasta) VALUES ('Mis', 'Nieznany', @id_gda);
INSERT INTO osoby (imie, nazwisko, id_miasta) VALUES ('Krol', 'Neptun', @id_sop);

set @id_kn =  LAST_INSERT_ID();

INSERT INTO osoby (imie, nazwisko, id_miasta) VALUES ('Juz', 'Niepracujacy', @id_wwa);

SET @id_jn =  LAST_INSERT_ID();

INSERT INTO firmy 
(	nazwa_skr
,	nazwa
,	id_miasta
,	kod_pocztowy
,	ulica
) VALUES 
(	'HP'
, 	'Hewlett Packard'
,	@id_wwa
,	'00-000'
,	'Szturmowa 2a'
);

INSERT INTO firmy 
(	nazwa_skr
,	nazwa
,	id_miasta
,	kod_pocztowy
,	ulica
) VALUES 
(	'UKSW'
,	'Uniwersytet Kardynala Stefana Wyszynskiego'
,	@id_wwa
,	'00-001'
,	'Dewajtis 5'
);

INSERT INTO firmy 
(	nazwa_skr
,	nazwa
,	id_miasta
,	kod_pocztowy
,	ulica
) VALUES 
(	'FLP'
,	'Fabryka Lodzi Podwodnych'
,	@id_wwa
,	'00-000'
,	'Na dnie 4'
);

CREATE TABLE etaty 
(	id_osoby 	int 		not null 
,	foreign key  (id_osoby)	references osoby(id_osoby)
,	id_firmy 	char(4) 	not null 
,	foreign key (id_firmy) references firmy(nazwa_skr)
,	stanowisko	varchar(60)	not null
,	pensja 		decimal(10,4) 		not null
,	od 		datetime 	not null
,	do 		datetime 	null
,	id_etatu 	int 		not null AUTO_INCREMENT 
,	primary key (id_etatu) 
);

INSERT INTO etaty 
(id_osoby
,	id_firmy
,	pensja
,	od
,	do
,	stanowisko
) VALUES 
(	@id_ms
,	'UKSW'
,	600
,	'1994-01-01'
,	'1998-01-01'
,	'Doktorant'
);

INSERT INTO etaty 
(id_osoby
,	id_firmy
,	pensja
,	od
,	do
,	stanowisko
) VALUES 
(	@id_ms
,	'UKSW'
,	1600
,	'1998-01-02'
,	'2000-01-01'
,	'Asystent'
);

INSERT INTO etaty 
(id_osoby
,	id_firmy
,	pensja
,	od
,	stanowisko
) VALUES 
(	@id_ms
,	'UKSW'
,	3200
,	'2000-01-02'
,	'Adiunkt'
);

INSERT INTO etaty 
(id_osoby
,	id_firmy
,	pensja
,	od
,	stanowisko
) VALUES 
(	@id_ms
,	'UKSW'
,	2200
,	'1999-01-01'
,	'Sprzatacz'
);

INSERT INTO etaty 
(id_osoby
,	id_firmy
,	pensja
,	od
,	stanowisko
) VALUES 
(	@id_ms
,	'HP'
,	20000
,	'2000-01-01'
,	'Konsultant'
);

INSERT INTO etaty 
(id_osoby
,	id_firmy
,	pensja
,	od
,	stanowisko
) VALUES 
(	@id_jk
,	'UKSW'
,	3200
,	'2001-11-10'
,	'Adiunkt'
);

INSERT INTO etaty 
(id_osoby
,	id_firmy
,	pensja
,	od
,	stanowisko
,	do
) VALUES 
(	@id_ms
,	'UKSW'
,	4200
,	'2004-09-22'
,	'Magazynier'
,	'2004-10-22'
);

INSERT INTO etaty 
(id_osoby
,	id_firmy
,	pensja
,	od
,	stanowisko
,	do
) VALUES 
(	@id_jn
,	'HP'
,	50000
,	'2000-01-01'
,	'Dyrektor'
,	'2002-10-21'
);

INSERT INTO etaty 
(id_osoby
,	id_firmy
,	pensja
,	od
,	stanowisko
,	do
) VALUES 
(	@id_ms
,	'FLP'
,	6200
,	'2004-09-22'
,	'Kierownik'
,	'2004-10-22'
);

INSERT INTO etaty 
(id_osoby
,	id_firmy
,	pensja
,	od
,	stanowisko
) VALUES 
(	@id_kn
,	'FLP'
,	65200
,	'2004-10-23'
,	'Prezes'
);

CREATE TABLE CECHY
(id_CECHY	int 		NOT NULL AUTO_INCREMENT
,	PRIMARY KEY (id_CECHY)
,	Opis_cechy	varchar(60)	NOT NULL
,	jednowybieralna	bit		NOT NULL	DEFAULT 0
);

CREATE TABLE WARTOSCI_CECH
(	id_wartosci	int		NOT NULL	AUTO_INCREMENT
,	PRIMARY KEY (id_wartosci)
,	id_CECHY	int 		NOT NULL
,	FOREIGN KEY (id_CECHY) REFERENCES CECHY(ID_CECHY)
,	Opis_wartosci	varchar(40)	NOT NULL
);

CREATE TABLE FIRMY_CECHY
(	id_wartosci	int		NOT NULL
,	FOREIGN KEY (id_wartosci) REFERENCES WARTOSCI_CECH(ID_WARTOSCI)
,	id_firmy	char(4)		NOT NULL
,	PRIMARY KEY (id_wartosci,id_firmy)
);

INSERT INTO CECHY (opis_cechy) VALUES ('Branza');

SET @id_br = LAST_INSERT_ID();

INSERT INTO CECHY (opis_cechy,jednowybieralna) VALUES ('Odpowiedz na Akcje Marketingowa - WIOSNA NASZA',1);

SET @id_am = LAST_INSERT_ID();

INSERT INTO WARTOSCI_CECH
(id_cechy
, opis_wartosci
) VALUES
(@id_br
, 'Komputery'
);

SET @id_br1 = LAST_INSERT_ID();

INSERT INTO FIRMY_CECHY (id_wartosci,id_firmy) VALUES (@id_br1,'HP');

INSERT INTO WARTOSCI_CECH
(	id_cechy
,	opis_wartosci
) VALUES
(	@id_br
,	'Drukarki'
);

SET @id_br1 = LAST_INSERT_ID();

INSERT INTO FIRMY_CECHY (id_firmy,id_wartosci) VALUES ('HP', @id_br1);

INSERT INTO WARTOSCI_CECH
(id_cechy
, opis_wartosci
) VALUES
(@id_br
, 'Szkolenia'
);

SET @id_br1 = LAST_INSERT_ID();

INSERT INTO FIRMY_CECHY (id_firmy,id_wartosci) VALUES ('HP', @id_br1);

INSERT INTO FIRMY_CECHY (id_firmy,id_wartosci) VALUES ('UKSW', @id_br1);

INSERT INTO WARTOSCI_CECH
(id_cechy
, opis_wartosci
) VALUES
(@id_am
, 'NIE'
);

INSERT INTO WARTOSCI_CECH
(id_cechy
, opis_wartosci
) VALUES
(@id_am
, 'TAK'
);

SET @id_br1 = LAST_INSERT_ID();

INSERT INTO FIRMY_CECHY (id_firmy,id_wartosci) VALUES ('HP', @id_br1);

INSERT INTO FIRMY_CECHY (id_firmy,id_wartosci) VALUES ('FLP', @id_br1);