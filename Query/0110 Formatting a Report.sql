-- Microsoft SQL Server Reporting Services
-- Loy Vanich (laploy@gmail.com)
-- 0110 Formatting a Report
SELECT
	soh.OrderDate AS [Date],
	soh.SalesOrderNumber AS [Order],
	pps.Name AS Subcat, pp.Name as Product,
	SUM(sd.OrderQty) AS Qty,
	SUM(sd.LineTotal) AS LineTotal
FROM Sales.SalesPerson sp
	INNER JOIN Sales.SalesOrderHeader AS soh
		ON sp.BusinessEntityID = soh.SalesPersonID
	INNER JOIN Sales.SalesOrderDetail AS sd
		ON sd.SalesOrderID = soh.SalesOrderID
	INNER JOIN Production.Product AS pp
		ON sd.ProductID = pp.ProductID
	INNER JOIN Production.ProductSubcategory AS pps
		ON pp.ProductSubcategoryID = pps.ProductSubcategoryID
	INNER JOIN Production.ProductCategory AS ppc
		ON ppc.ProductCategoryID = pps.ProductCategoryID
	GROUP BY ppc.Name, soh.OrderDate, soh.SalesOrderNumber, pps.Name, pp.Name,
	soh.SalesPersonID
HAVING ppc.Name = 'Clothing'