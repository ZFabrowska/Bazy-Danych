--k
SELECT stanowisko,
COUNT (*) AS liczba_pracownikow
FROM ksiegowosc.pensja
GROUP BY stanowisko

--l
SELECT 
AVG(kwota) AS srednia_placa,
MIN(kwota) AS min_placa,
MAX(kwota) AS max_placa
FROM ksiegowosc.pensja
WHERE stanowisko = 'sta¿ysta';

--m
SELECT
SUM(pn.kwota) + SUM(pr.kwota) AS suma_wynagrodzen
FROM ksiegowosc.pensja pn
JOIN ksiegowosc.wynagrodzenie w ON w.id_pensji=pn.id_pensji
JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii

--f
SELECT pn.stanowisko,
SUM(pn.kwota) + SUM(pr.kwota) AS suma_wynagrodzen
FROM ksiegowosc.pensja pn
JOIN ksiegowosc.wynagrodzenie w ON w.id_pensji=pn.id_pensji
JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii
GROUP BY pn.stanowisko

--g
SELECT pn.stanowisko,
COUNT(pr.id_premii) AS liczba_premii
FROM ksiegowosc.pensja pn
JOIN ksiegowosc.wynagrodzenie w ON w.id_pensji=pn.id_pensji
JOIN ksiegowosc.premia pr ON pr.id_premii = w.id_premii
GROUP BY pn.stanowisko

--h
DELETE p
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=p.id_pracownika
JOIN ksiegowosc.pensja pn ON pn.id_pensji = w.id_pensji
WHERE pn.kwota <1200