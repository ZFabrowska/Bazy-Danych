--a
ALTER TABLE ksiegowosc.pracownicy
ADD nowy_telefon VARCHAR(20);

UPDATE ksiegowosc.pracownicy
SET nowy_telefon = CONCAT('(+48)', telefon); -- concat łączy kilka ciągów znaków w jeden

ALTER TABLE ksiegowosc.pracownicy
DROP COLUMN telefon;

EXEC sp_rename 'ksiegowosc.pracownicy.nowy_telefon', 'telefon2', 'COLUMN'; --zmiana nazwy obiektu: stara nazwa, nowa nazwa, typ obiektu
--execute, stored procedure
SELECT * FROM ksiegowosc.pracownicy

--b
-- jeśli już wcześniej utworzono kolumnę o nazwie telefon3 - to muszę ją usunąć
--ALTER TABLE ksiegowosc.pracownicy
--DROP COLUMN telefon3;

ALTER TABLE ksiegowosc.pracownicy
ADD telefon3 VARCHAR(20);

UPDATE ksiegowosc.pracownicy
SET telefon3 = CONCAT(
    SUBSTRING(telefon, 1, 3), '-', -- pobieranie ciągu znaków. Nazwa - start - długość
    SUBSTRING(telefon, 4, 3), '-', 
    SUBSTRING(telefon, 7, 3))
SELECT * FROM ksiegowosc.pracownicy

--c
ALTER TABLE ksiegowosc.pracownicy
ADD nazwisko1 VARCHAR(20);

UPDATE ksiegowosc.pracownicy
SET nazwisko1 = UPPER(nazwisko) --upper zmienia na duże litery

SELECT TOP 1 * FROM ksiegowosc.pracownicy
ORDER BY LEN(nazwisko1) DESC; -- len zlicza ilość znaków

--ALTER TABLE ksiegowosc.pracownicy
--DROP COLUMN nazwisko; -- żeby usunąć poprzednią kolumnę nazwisko

--d
SELECT p.imie, p.nazwisko, HASHBYTES('MD5', CONVERT(VARCHAR, pn.kwota)) AS pensja_md5
--algorytm MD5, konwersja pn.kwota na varchar bo algorytm wymaga varchar
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensja pn ON pn.id_pensji = w.id_pensji

--f
SELECT p.imie, p.nazwisko, pn.kwota AS pensja, pr.kwota AS premia
FROM ksiegowosc.pracownicy p
LEFT JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika = p.id_pracownika
LEFT JOIN ksiegowosc.pensja pn ON pn.id_pensji = w.id_pensji
LEFT JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii;

--g 104 = konwersja na varchar typu 31.10.2021
SELECT 
CONCAT('Pracownik ',p.imie,' ',p.nazwisko,', w dniu ', 
CONVERT(VARCHAR, g.dataa, 104), ' otrzymał pensję całkowitą na kwotę ', 
(pn.kwota+pr.kwota),' zł, gdzie wynagrodzenie zasadnicze wynosiło: ',pn.kwota, ' zł, premia: ',
pr.kwota, ' zł, nadgodziny: ',(g.liczba_godzin - 8), 'godz.')
AS raport
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.godziny g ON g.id_godziny=w.id_godziny
JOIN ksiegowosc.pensja pn ON pn.id_pensji=w.id_pensji
JOIN ksiegowosc.premia pr ON pr.id_premii=w.id_premii
