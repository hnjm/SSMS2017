-- Microsoft SQL Server Reporting Services
-- Loy Vanich (laploy@gmail.com)
-- 0100 Crate first report
SELECT
	SalesLT.Product.ProductID, 
	SalesLT.Product.Name, 
	SalesLT.ProductCategory.Name AS Category, 
	SalesLT.Product.Color, 
	alesLT.Product.ListPrice
FROM SalesLT.Product 
	INNER JOIN SalesLT.ProductCategory 
		ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID