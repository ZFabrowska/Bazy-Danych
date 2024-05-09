CREATE DATABASE firma2;
USE firma2;
CREATE SCHEMA ksiegowosc;

--tabela pracownikow
CREATE TABLE ksiegowosc.pracownicy (
id_pracownika INTEGER NOT NULL PRIMARY KEY,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
adres VARCHAR(100) NOT NULL,
telefon INTEGER);

--tabela godzin
CREATE TABLE ksiegowosc.godziny (
id_godziny INTEGER NOT NULL PRIMARY KEY,
dataa DATE NOT NULL,
liczba_godzin INTEGER NOT NULL,
id_pracownika INTEGER NOT NULL,
FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy (id_pracownika)
ON DELETE CASCADE
ON UPDATE CASCADE
);

--tabela pensji
CREATE TABLE ksiegowosc.pensja (
id_pensji INTEGER NOT NULL PRIMARY KEY,
stanowisko VARCHAR(50) NOT NULL,
kwota INTEGER NOT NULL,)

--tabela premii
CREATE TABLE ksiegowosc.premia (
id_premii INTEGER NOT NULL PRIMARY KEY,
rodzaj VARCHAR(100),
kwota INTEGER NOT NULL);

--tabela laczaca, wynagrodzenie
CREATE TABLE ksiegowosc.wynagrodzenie (
id_wynagrodzenia INTEGER NOT NULL PRIMARY KEY,
dataa DATE NOT NULL,
id_pracownika INTEGER NOT NULL,
id_godziny INTEGER NOT NULL,
id_pensji INTEGER NOT NULL,
id_premii INTEGER NOT NULL,
FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy (id_pracownika)
ON DELETE NO ACTION,
FOREIGN KEY (id_godziny)
REFERENCES ksiegowosc.godziny (id_godziny)
ON DELETE NO ACTION,
FOREIGN KEY (id_pensji)
REFERENCES ksiegowosc.pensja (id_pensji)
ON DELETE NO ACTION,
FOREIGN KEY (id_premii)
REFERENCES ksiegowosc.premia (id_premii)
ON DELETE NO ACTION)

INSERT INTO ksiegowosc.pracownicy VALUES 
(1, 'Anna', 'Agrafka', 'Nowa 10', 601601601),
(2, 'Barbara', 'Biodeo', 'Rozowa 6', 601601602),
(3, 'Cezary', 'Czapka', 'Rozana 1', 601601603),
(4, 'Danuta', 'Dšb', 'Wroclawska 6', 601601604),
(5, 'Eugeniusz', 'Bagno', 'Niebieska 5', 601601605),
(6, 'Faustyna', 'Figarska', 'Czarna 4', 601601606),
(7, 'Grzegorz', 'Zegarek', 'Bliska 1', 601601607),
(8, 'Halina', 'Kłos', 'Daleka 1', 601601608),
(9, 'Ignacy', 'Daszyński', 'Chmielowa 45', 601601609),
(10, 'Justyna', 'Kowalik', 'Czarna 1', 601601610);

INSERT INTO ksiegowosc.godziny VALUES
(1, '2024-03-25', 8, 1),
(2, '2024-03-25', 9, 2),
(3, '2024-03-25', 7, 3),
(4, '2024-03-25', 3, 4),
(5, '2024-03-25', 5, 5),
(6, '2024-03-25', 6, 6),
(7, '2024-03-25', 8, 7),
(8, '2024-03-25', 9, 8),
(9, '2024-03-25', 12, 9),
(10, '2024-03-25', 7, 10);

INSERT INTO ksiegowosc.pensja VALUES
(1, 'szef', 8000),
(2, 'zastepca szefa', 7000),
(3, 'zastepca szefa', 7000),
(4, 'księgowy', 5000),
(5, 'kasjer', 3000),
(6, 'kasjer', 3000),
(7, 'manager', 4500),
(8, 'specjalista ds sprzedaży', 4200),
(9, 'stażysta', 3200),
(10, 'stażysta', 3200);

INSERT INTO ksiegowosc.premia VALUES
(1, 'dobra praca', 800),
(2, 'dobra praca', 800),
(3, 'dobra praca', 800),
(4, 'nowi klienci', 500),
(5, 'nowi klienci', 500),
(6, 'nowi klienci', 500),
(7, 'premia nowicjusza', 200),
(8, 'premia nowicjusza', 200),
(9, 'premia nowicjusza', 200),
(10, 'premia nowicjusza', 200);

INSERT INTO ksiegowosc.wynagrodzenie VALUES
(1, '2024-03-25',1,1,1,1),
(2, '2024-03-25',2,2,2,2),
(3, '2024-03-25',3,3,3,3),
(4, '2024-03-25',4,4,4,4),
(5, '2024-03-25',5,5,5,5),
(6, '2024-03-25',6,6,6,6),
(7, '2024-03-25',7,7,7,7),
(8, '2024-03-25',8,8,8,8),
(9, '2024-03-25',9,9,9,9),
(10, '2024-03-25',10,10,10,10);

--a
SELECT id_pracownika,nazwisko FROM ksiegowosc.pracownicy
--b
SELECT p.id_pracownika 
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika = p.id_pracownika
JOIN ksiegowosc.pensja pn ON w.id_pensji = pn.id_pensji
WHERE pn.kwota > 1000;
--c
SELECT p.id_pracownika
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensja pn ON w.id_pensji=pn.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii=pr.id_premii
WHERE pr.id_premii IS NULL AND pn.kwota > 2000;
--d
SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';
--e
SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE '%a' AND nazwisko LIKE '%n%';
--f
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.godziny g ON p.id_pracownika=g.id_godziny
WHERE g.liczba_godzin*20 > 160; --bo 20 dni w miesiacu
--g
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensja pn ON pn.id_pensji = w.id_pensji
WHERE pn.kwota BETWEEN 1500 AND 3000
--h
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.godziny g ON g.id_godziny = w.id_godziny
JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii
WHERE g.liczba_godzin > 8 AND pr.id_premii IS NULL
--i
SELECT p.imie, p.nazwisko, pn.kwota
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensja pn ON pn.id_pensji = w.id_pensji
ORDER BY pn.kwota
--j
SELECT p.imie, p.nazwisko, pn.kwota AS kwPensji, pr.kwota AS kwPremii 
--nowe nazwy kolumn co by nie było 2x "kwota"
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensja pn ON pn.id_pensji = w.id_pensji
JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii
ORDER BY pn.kwota DESC, pr.kwota DESC
