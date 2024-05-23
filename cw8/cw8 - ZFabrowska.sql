--ZAD1
USE AdventureWorks2022

--patrz� co jest w danych tabelach
SELECT * FROM AdventureWorks2022.Person.Person
SELECT * FROM AdventureWorks2022.HumanResources.EmployeePayHistory

--CTE. ��czy Person+Employee kolumn� ID. Wybiera 4 kolumny i daje nowe nazwy
WITH zapytanie (id, imie, nazwisko, stawka) 
AS
(
	SELECT p.BusinessEntityID, FirstName, LastName, Rate
	FROM AdventureWorks2022.Person.Person p
	INNER JOIN AdventureWorks2022.HumanResources.EmployeePayHistory e
	ON p.BusinessEntityID=e.BusinessEntityID
)
--wyniki CTE zapisane do tabeli tymczasowej
SELECT * INTO TempEmployeeInfo FROM zapytanie;

--wynik operacji
SELECT * FROM TempEmployeeInfo;
SELECT * FROM AdventureWorks2022.HumanResources.EmployeePayHistory





--ZAD2
USE AdventureWorksLT2022

SELECT *FROM AdventureWorksLT2022.SalesLT.SalesOrderHeader;
SELECT *FROM AdventureWorksLT2022.SalesLT.Customer;

--tworz� CTE2. ��cz� Customer i SOH na ID. Concat ��czy kilka kolumn w jedn�. Te nawiasy to �eby si� zgadza�o ze wzorem polecenia
WITH zapytanie2 (CompanyContact, Revenue)
AS 
(
	SELECT CONCAT( CompanyName, ' (', FirstName, ' ', LastName, ')' ), TotalDue
	FROM SalesLT.Customer c
	INNER JOIN SalesLT.SalesOrderHeader s
	ON c.CustomerID=s.CustomerID
)
--wyniki w kolejno�ci. Order by jest ostatnie, group by niekoniecznie
SELECT * FROM zapytanie2
ORDER BY CompanyContact




--ZAD3
SELECT * FROM SalesLT.ProductCategory
SELECT * FROM SalesLT.Product
SELECT * FROM SalesLT.SalesOrderDetail

WITH zapytanie3 (Category, SalesValue)
AS
(
	SELECT c.Name, UnitPrice
	FROM SalesLT.Product p
	INNER JOIN SalesLT.ProductCategory c
	ON p.ProductCategoryID=c.ProductCategoryID
	INNER JOIN SalesLT.SalesOrderDetail o
	ON p.ProductID=o.ProductID
)
--SELECT * FROM zapytanie3
SELECT Category, SUM(SalesValue) AS SalesValue
FROM zapytanie3 
GROUP BY Category