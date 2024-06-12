CREATE DATABASE geochronologia;

CREATE SCHEMA geo;

--utworzenie tabeli
CREATE TABLE geo.GeoEon(
    id_eon INT PRIMARY KEY,
    nazwa_eon VARCHAR(30)
);

CREATE TABLE geo.GeoEra(
    id_era INT PRIMARY KEY,
    nazwa_era VARCHAR(30),
    id_eon INT
);

CREATE TABLE geo.GeoOkres(
    id_okres INT PRIMARY KEY,
    nazwa_okres VARCHAR(30),
    id_era INT
);

CREATE TABLE geo.GeoEpoka(
    id_epoka INT PRIMARY KEY,
    nazwa_epoka VARCHAR(30),
    id_okres INT
);

CREATE TABLE geo.GeoPietro(
    id_pietro INT PRIMARY KEY,
    nazwa_pietro VARCHAR(30),
    id_epoka INT
);

--dodanie kluczy obcych
ALTER TABLE geo.GeoEra ADD FOREIGN KEY (id_eon) REFERENCES geo.GeoEon(id_eon);
ALTER TABLE geo.GeoOkres ADD FOREIGN KEY (id_era) REFERENCES geo.GeoEra(id_era);
ALTER TABLE geo.GeoEpoka ADD FOREIGN KEY (id_okres) REFERENCES geo.GeoOkres(id_okres);
ALTER TABLE geo.GeoPietro ADD FOREIGN KEY (id_epoka) REFERENCES geo.GeoEpoka(id_epoka);

-- uzupelnianie Eonu
INSERT INTO geo.GeoEon VALUES(1, 'Fanerozoik');
SELECT * FROM geo.GeoEon;

-- uzupelnianie er
INSERT INTO geo.GeoEra VALUES(1, 'Paleozoik', 1);
INSERT INTO geo.GeoEra VALUES(2, 'Mezozoik', 1);
INSERT INTO geo.GeoEra VALUES(3, 'Kenozoik', 1);
SELECT * FROM geo.GeoEra;

-- uzupelnianie okresow
INSERT INTO geo.GeoOkres VALUES(1, 'Dewon',1);
INSERT INTO geo.GeoOkres VALUES(2, 'Karbon',1);
INSERT INTO geo.GeoOkres VALUES(3, 'Perm',1);
INSERT INTO geo.GeoOkres VALUES(4, 'Trias',2);
INSERT INTO geo.GeoOkres VALUES(5, 'Jura',2);
INSERT INTO geo.GeoOkres VALUES(6, 'Kreda',2);
INSERT INTO geo.GeoOkres VALUES(7, 'Trzeciorzed: Palogen',3);
INSERT INTO geo.GeoOkres VALUES(8, 'Trzeciorzed: Neogen',3);
INSERT INTO geo.GeoOkres VALUES(9, 'Czwartorzad',3);
SELECT * FROM geo.GeoOkres;

-- uzupelnianie epok
INSERT INTO geo.GeoEpoka VALUES(1, 'Dolny', 1);
INSERT INTO geo.GeoEpoka VALUES(2, 'Srodkowy', 1);
INSERT INTO geo.GeoEpoka VALUES(3, 'Gorny', 1);
INSERT INTO geo.GeoEpoka VALUES(4, 'Dolny', 2);
INSERT INTO geo.GeoEpoka VALUES(5, 'Gorny', 2);
INSERT INTO geo.GeoEpoka VALUES(6, 'Dolny', 3);
INSERT INTO geo.GeoEpoka VALUES(7, 'Gorny', 3);
INSERT INTO geo.GeoEpoka VALUES(8, 'Dolny', 4);
INSERT INTO geo.GeoEpoka VALUES(9, 'Srodkowy', 4);
INSERT INTO geo.GeoEpoka VALUES(10, 'Gorny', 4);
INSERT INTO geo.GeoEpoka VALUES(11, 'Dolna', 5);
INSERT INTO geo.GeoEpoka VALUES(12, 'Srodkowa', 5);
INSERT INTO geo.GeoEpoka VALUES(13, 'Gorna', 5);
INSERT INTO geo.GeoEpoka VALUES(14, 'Dolna', 6);
INSERT INTO geo.GeoEpoka VALUES(15, 'Gorna', 6);
INSERT INTO geo.GeoEpoka VALUES(16, 'Paleocen', 7);
INSERT INTO geo.GeoEpoka VALUES(17, 'Eocen', 7);
INSERT INTO geo.GeoEpoka VALUES(18, 'Oligocen', 7);
INSERT INTO geo.GeoEpoka VALUES(19, 'Miocen', 8);
INSERT INTO geo.GeoEpoka VALUES(20, 'Pliocen', 8);
INSERT INTO geo.GeoEpoka VALUES(21, 'Plejstocen', 9);
INSERT INTO geo.GeoEpoka VALUES(22, 'Holocen', 9);
SELECT * FROM geo.GeoEpoka;

-- uzupelnianie pieter
INSERT INTO geo.GeoPietro VALUES(1,'Lochkow',1);
INSERT INTO geo.GeoPietro VALUES(2,'Prag',1);
INSERT INTO geo.GeoPietro VALUES(3,'Ems',1);
INSERT INTO geo.GeoPietro VALUES(4,'Eifel',2);
INSERT INTO geo.GeoPietro VALUES(5,'Zywet',2);
INSERT INTO geo.GeoPietro VALUES(6,'Fran',3);
INSERT INTO geo.GeoPietro VALUES(7,'Famen',3);
INSERT INTO geo.GeoPietro VALUES(8,'Turnej',4);
INSERT INTO geo.GeoPietro VALUES(9,'Wizen',4);
INSERT INTO geo.GeoPietro VALUES(10,'Serpuchow',4);
INSERT INTO geo.GeoPietro VALUES(11,'Baszkir',5);
INSERT INTO geo.GeoPietro VALUES(12,'Moskow',5);
INSERT INTO geo.GeoPietro VALUES(13,'Kasimow',5);
INSERT INTO geo.GeoPietro VALUES(14,'Gzel',5);
INSERT INTO geo.GeoPietro VALUES(15,'Assel',6);
INSERT INTO geo.GeoPietro VALUES(16,'Sakmar',6);
INSERT INTO geo.GeoPietro VALUES(17,'Artinsk',6);
INSERT INTO geo.GeoPietro VALUES(18,'Kungur',6);
INSERT INTO geo.GeoPietro VALUES(19,'Road',7);
INSERT INTO geo.GeoPietro VALUES(20,'Word',7);
INSERT INTO geo.GeoPietro VALUES(21,'Kapitan',7);
INSERT INTO geo.GeoPietro VALUES(22,'Wucziaping',7);
INSERT INTO geo.GeoPietro VALUES(23,'Czangsing',7);
INSERT INTO geo.GeoPietro VALUES(24,'Ind',8);
INSERT INTO geo.GeoPietro VALUES(25,'Olenek',8);
INSERT INTO geo.GeoPietro VALUES(26,'Anizyk',9);
INSERT INTO geo.GeoPietro VALUES(27,'Ladyn',9);
INSERT INTO geo.GeoPietro VALUES(28,'Karnik',10);
INSERT INTO geo.GeoPietro VALUES(29,'Noryk',10);
INSERT INTO geo.GeoPietro VALUES(30,'Retyk',10);
INSERT INTO geo.GeoPietro VALUES(31,'Hettang',11);
INSERT INTO geo.GeoPietro VALUES(32,'Synemur',11);
INSERT INTO geo.GeoPietro VALUES(33,'Pliensbach',11);
INSERT INTO geo.GeoPietro VALUES(34,'Toark',11);
INSERT INTO geo.GeoPietro VALUES(35,'Aalen',12);
INSERT INTO geo.GeoPietro VALUES(36,'Bajos',12);
INSERT INTO geo.GeoPietro VALUES(37,'Baton',12);
INSERT INTO geo.GeoPietro VALUES(38,'Kelowej',12);
INSERT INTO geo.GeoPietro VALUES(39,'oksford',13);
INSERT INTO geo.GeoPietro VALUES(40,'Kimeryd',13);
INSERT INTO geo.GeoPietro VALUES(41,'Tyton',13);
INSERT INTO geo.GeoPietro VALUES(42,'Berrias',14);
INSERT INTO geo.GeoPietro VALUES(43,'Walanzyn',14);
INSERT INTO geo.GeoPietro VALUES(44,'Hoteryw',14);
INSERT INTO geo.GeoPietro VALUES(45,'Barrem',14);
INSERT INTO geo.GeoPietro VALUES(46,'Apt',14);
INSERT INTO geo.GeoPietro VALUES(47,'Alb',14);
INSERT INTO geo.GeoPietro VALUES(48,'Cenoman',15);
INSERT INTO geo.GeoPietro VALUES(49,'Turon',15);
INSERT INTO geo.GeoPietro VALUES(50,'Koniak',15);
INSERT INTO geo.GeoPietro VALUES(51,'Santon',15);
INSERT INTO geo.GeoPietro VALUES(52,'Kampan',15);
INSERT INTO geo.GeoPietro VALUES(53,'Mastrycht',15);
INSERT INTO geo.GeoPietro VALUES(54,'Dan',16);
INSERT INTO geo.GeoPietro VALUES(55,'Zeland',16);
INSERT INTO geo.GeoPietro VALUES(56,'Tanet',16);
INSERT INTO geo.GeoPietro VALUES(57,'Iprez',17);
INSERT INTO geo.GeoPietro VALUES(58,'Lutet',17);
INSERT INTO geo.GeoPietro VALUES(59,'Barton',17);
INSERT INTO geo.GeoPietro VALUES(60,'Priabon',17);
INSERT INTO geo.GeoPietro VALUES(61,'Rupel',18);
INSERT INTO geo.GeoPietro VALUES(62,'Szat',18);
INSERT INTO geo.GeoPietro VALUES(63,'Akwitan',19);
INSERT INTO geo.GeoPietro VALUES(64,'Burdyga',19);
INSERT INTO geo.GeoPietro VALUES(65,'Lang',19);
INSERT INTO geo.GeoPietro VALUES(66,'Serrawal',19);
INSERT INTO geo.GeoPietro VALUES(67,'Torton',19);
INSERT INTO geo.GeoPietro VALUES(68,'Messyn',19);
INSERT INTO geo.GeoPietro VALUES(69,'Zankl',20);
INSERT INTO geo.GeoPietro VALUES(70,'Piacent',20);
INSERT INTO geo.GeoPietro VALUES(71,'Gelas',21);
INSERT INTO geo.GeoPietro VALUES(72,'Kalabr',21);
INSERT INTO geo.GeoPietro VALUES(73,'Chiban',21);
INSERT INTO geo.GeoPietro VALUES(74,'Tarant',21);
INSERT INTO geo.GeoPietro VALUES(75,'Grenland',22);
INSERT INTO geo.GeoPietro VALUES(76,'Nortgryp',22);
INSERT INTO geo.GeoPietro VALUES(77,'Megalaj',22);
SELECT * FROM geo.GeoPietro;

-- Utworzenie tabeli zdenormalizowanej
CREATE TABLE GeoTabela AS
    (SELECT * FROM geo.GeoPietro NATURAL JOIN geo.GeoEpoka NATURAL JOIN geo.GeoOkres NATURAL JOIN geo.GeoEra NATURAL JOIN geo.GeoEon);
SELECT * FROM GeoTabela;

--tabela pomocnicza Dziesiec
CREATE TABLE Dziesiec(
    cyfra INT,
    bit INT
);

INSERT INTO Dziesiec VALUES(0,1);
INSERT INTO Dziesiec VALUES(1,1);
INSERT INTO Dziesiec VALUES(2,1);
INSERT INTO Dziesiec VALUES(3,1);
INSERT INTO Dziesiec VALUES(4,1);
INSERT INTO Dziesiec VALUES(5,1);
INSERT INTO Dziesiec VALUES(6,1);
INSERT INTO Dziesiec VALUES(7,1);
INSERT INTO Dziesiec VALUES(8,1);
INSERT INTO Dziesiec VALUES(9,1);
SELECT * FROM Dziesiec;

-- tabela Milion
CREATE TABLE Milion(
    liczba INT,
    cyfra INT,
    bit INT
);

INSERT INTO  Milion
SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 100000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;
SELECT * FROM Milion WHERE ;
SELECT COUNT(*) FROM Milion;

--zapytanie 1 ZL
SELECT COUNT(*) FROM Milion
INNER JOIN GeoTabela ON (mod(Milion.liczba,68)=(GeoTabela.id_pietro));

--zapytanie 2 ZL
SELECT COUNT(*) FROM Milion 
INNER JOIN geo.GeoPietro ON (mod(Milion.liczba,68)=GeoPietro.id_pietro) 
NATURAL JOIN geo.GeoEpoka 
NATURAL JOIN geo.GeoOkres 
NATURAL JOIN geo.GeoEra 
NATURAL JOIN geo.GeoEon;

--zapytanie 3 ZG
SELECT COUNT(*) FROM Milion 
	WHERE mod(Milion.liczba,68)= 
(SELECT id_pietro FROM GeoTabela WHERE mod(Milion.liczba,68)=(id_pietro));

--zapytanie 4 ZG
SELECT COUNT(*) FROM Milion 
	WHERE mod(Milion.liczba,68) IN
(SELECT geo.GeoPietro.id_pietro FROM geo.GeoPietro 
	NATURAL JOIN geo.GeoEpoka 
	NATURAL JOIN geo.GeoOkres 
	NATURAL JOIN geo.GeoEra 
	NATURAL JOIN geo.GeoEon);

--dodanie indeksow
CREATE INDEX idxEon ON geo.GeoEon(id_eon);
CREATE INDEX idxEra ON geo.GeoEra(id_era, id_eon);
CREATE INDEX idxOkres ON geo.GeoOkres(id_okres, id_era);
CREATE INDEX idxEpoka ON geo.GeoEpoka(id_epoka, id_okres);
CREATE INDEX idxPietro ON geo.GeoPietro(id_pietro, id_epoka);
CREATE INDEX idxLiczba ON Milion(liczba);
CREATE INDEX idxGeoTabela ON GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);