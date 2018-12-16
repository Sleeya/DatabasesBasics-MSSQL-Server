SELECT 
	ProductName,
	OrderDate,
	DATEADD(dd,3,OrderDate) AS 'Pay Due',
	DATEADD(MM,1,OrderDate) AS 'Deliver Due'
FROM Orders
