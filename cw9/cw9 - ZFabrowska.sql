USE AdventureWorks2022;
--ZAD1
SELECT * FROM Production.Product WHERE ProductID = 680;

BEGIN TRANSACTION tr1;
UPDATE Production.Product SET ListPrice = ListPrice*1.1
WHERE ProductID = 680
COMMIT; 



--ZAD2
--EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all";

BEGIN TRANSACTION tr2;
DELETE FROM Production.Product
WHERE ProductID=707
PRINT 'usunieto'
ROLLBACK;

SELECT * FROM Production.Product WHERE ProductID=707;


--ZAD3
--SET IDENTITY_INSERT Production.Product ON;

BEGIN TRANSACTION tr3;
INSERT INTO Production.Product(ProductID,Name,ProductNumber,MakeFlag,FinishedGoodsFlag,Color,SafetyStockLevel,ReorderPoint,StandardCost,ListPrice,DaysToManufacture,SellStartDate,ModifiedDate)
VALUES(10, 'Ice-creams', 'ZF-607', 0, 0, NULL, 1000, 375, 600, 0.00, 0.00, '2001-06-01 00:00:00.000', '2020-06-01 10:00:50.000');
COMMIT;

SELECT * FROM Production.Product
ORDER BY ProductID;



--ZAD4
BEGIN TRANSACTION tr4;
UPDATE Production.Product
SET StandardCost = StandardCost*1.1

IF (SELECT SUM(StandardCost) FROM Production.Product) <= 50000
	BEGIN
		COMMIT;
		PRINT 'Transakcja zatwierdzona';
	END
	ELSE
	BEGIN
		ROLLBACK;
		PRINT 'Transakcja odrzucona';
	END;

SELECT SUM(StandardCost) FROM Production.Product;



--ZAD5
BEGIN TRANSACTION tr5;
IF EXISTS (SELECT * FROM Production.Product WHERE ProductNumber='ZF-3519')
	BEGIN
		PRINT 'Ten produkt juz istnieje'
		ROLLBACK
	END;
ELSE
	BEGIN
		INSERT INTO Production.Product(ProductID,Name,ProductNumber,MakeFlag,FinishedGoodsFlag,Color,SafetyStockLevel,ReorderPoint,StandardCost,ListPrice,DaysToManufacture,SellStartDate,ModifiedDate)
		VALUES(6, 'Mouse', 'ZF-3519', 0, 0, NULL, 1000, 300, 0.00, 0.00, 1, '2013-06-02 00:00:00.000', '2014-06-02 10:00:50.000');
		COMMIT
	END;

SELECT * FROM Production.Product
ORDER BY ProductID;


--ZAD6
SELECT * FROM Sales.SalesOrderDetail WHERE OrderQty=0;

BEGIN TRANSACTION tr6;
IF EXISTS (SELECT * FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
	BEGIN
		PRINT 'transakcja odrzucona'
		ROLLBACK;
	END;
ELSE
	BEGIN
		UPDATE Sales.SalesOrderDetail
		SET OrderQty = OrderQty + 1
		PRINT 'transakcja wykonana'
		COMMIT;
	END;



--ZAD7
SELECT AVG(StandardCost) AS srednia FROM Production.Product
SELECT StandardCost FROM Production.Product WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);

BEGIN TRANSACTION tr7;
DELETE FROM Production.Product
WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);
IF @@ROWCOUNT > 10
	BEGIN
		PRINT 'transakcja odrzucona';
		ROLLBACK;
	END;
ELSE
	BEGIN
		PRINT 'transakcja wykonana';
		COMMIT;
	END;