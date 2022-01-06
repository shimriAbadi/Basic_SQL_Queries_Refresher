use NorthWind

insert into dbo.Orders
(OrderID)
values (1202);

insert into dbo.Products
(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
values (90, 'cake',8,5,4,0,0,0,0,1 );

insert into dbo.Suppliers
(SupplierID,CompanyName)
values(30 , 'TMI');

select dbo.Products.ProductID,dbo.Products.ProductName ,dbo.Suppliers.SupplierID, dbo.Suppliers.CompanyName
from (dbo.Suppliers
right join dbo.Products on dbo.Suppliers.SupplierID = dbo.Products.SupplierID)
Order by dbo.Products.ProductName ASC;

select dbo.Suppliers.CompanyName , count(dbo.Products.ProductID) AS ProductsHeGive
from (dbo.Suppliers
right join dbo.Products on dbo.Suppliers.SupplierID = dbo.Products.SupplierID)
group by dbo.Suppliers.CompanyName;

select dbo.Suppliers.CompanyName , count(dbo.Products.ProductID) AS ProductsHeGive
from (dbo.Suppliers
right join dbo.Products on dbo.Suppliers.SupplierID = dbo.Products.SupplierID)
group by dbo.Suppliers.CompanyName
having count(dbo.Products.ProductID)>=4;

select dbo.Suppliers.CompanyName , count(dbo.Products.ProductID) AS ProductsHeGive
from (dbo.Products
right join dbo.Suppliers on dbo.Suppliers.SupplierID = dbo.Products.SupplierID)
group by dbo.Suppliers.CompanyName;