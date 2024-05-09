USE AdventureWorks2022;

--ZAD 1
-- tworzê funkcjê o dwóch argumentach INT, która zwraca INT
CREATE FUNCTION generacja_fibonacci(@first INT, @second INT)
RETURNS INT
-- pocz¹tek funkcji
AS
BEGIN
	RETURN @first + @second;
END;

-- tworzê procedurê o argumencie INT
CREATE PROCEDURE pisanie_Fibonacci (@n INT)
AS
BEGIN
--deklarujê pierwszy i drugi wyraz ci¹gu, iterator = 3, bo dwa pierwsze wyrazy s¹ ju¿ wygenerowane
	DECLARE @first INT;
	DECLARE @second INT;
	DECLARE @sum INT;
	DECLARE @iterator INT;
	SET @first = 0;
	SET @second = 1;
	SET @iterator = 3;
	PRINT @first;
	PRINT @second;
	-- pêtla while dzia³a dopóki iterator <=n
	WHILE (@iterator <= @n)
	BEGIN
	-- dbo - odwo³anie do schematu gdzie jest szukana funkcja
		SET @sum = (SELECT dbo.generacja_Fibonacci(@first, @second));
		PRINT @sum;
		SET @first = @second;
		SET @second = @sum;
		SET @iterator = @iterator +1;
	END;
END;

--wywo³anie procedury
EXEC pisanie_Fibonacci @n=10;




--ZAD2
--trigger DML - aktywowany w odpowiedzi na update/insert. Po ich u¿yciu (after)
CREATE TRIGGER duze
ON Person.Person
AFTER INSERT, UPDATE
--start triggera
AS
BEGIN
	UPDATE Person.Person 
	-- zmiana na du¿e litery
	SET LastName = UPPER(LastName) 
	FROM Person.Person
END;
--wyœwietlenie tabeli
SELECT * FROM Person.Person;

--tabela ma klucze zewnêtrzne. Mg albo usun¹æ ten klucz albo dodaæ odpowiedni rekord do BusinessEntity.
--"operacja INSERT, dodaje wiersz do tabeli, wstawiaj¹c nowy identyfikator globalnie unikatowy (GUID) wygenerowany przez funkcjê NEWID().
INSERT INTO Person.BusinessEntity(rowguid)
VALUES(NEWID());

--dodanie czegoœ do Person.Person ¿eby aktywowaæ trigger
INSERT INTO Person.Person (BusinessEntityID, PersonType, NameStyle, Title, FirstName, MiddleName, LastName, Suffix, 
	EmailPromotion, AdditionalContactInfo, ModifiedDate)
VALUES (20778, 'IN', 0, 'NULL', 'anna', 'izabela', 'lecka', NULL, 1, NULL, 2008-01-24);

--sprawdzenie ¿e trigger zadzia³a³
SELECT * FROM Person.Person WHERE BusinessEntityID = 20778;





--ZAD3
CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @newTax FLOAT;
	DECLARE @oldTax FLOAT;
	-- przypisanie starej i nowej wartoœci z rekordu odpowiednim zmiennym
	SELECT @newTax = TaxRate FROM INSERTED;
	SELECT @oldTax =TaxRate FROM DELETED;
	--warunek if do printowania b³êdu
	IF (@newTax > 1.3 * @oldTax OR @newTax < 0.7 * @oldTax)
	PRINT 'Change in Tax is bigger than 30%'
END;

--zmiana rekordu dla SalesTaxRateID=1 ¿eby sprawdziæ czy dzia³a
UPDATE Sales.SalesTaxRate 
SET TaxRate = 1 
WHERE SalesTaxRateID = 1;
--wyœwietlenie tego¿ rekordu
SELECT * FROM Sales.SalesTaxRate WHERE SalesTaxRateID=1;