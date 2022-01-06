use NorthWind

/**PART A**/

/**QUERY A1**/

insert into dbo.MyEmployee
select * from dbo.Employees;

/**QUERY A2**/

delete 
from dbo.MyEmployee
where year(dbo.MyEmployee.BirthDate)<1955 and dbo.MyEmployee.City not like 'london';

/**QUERY A3**/

update dbo.MyEmployee
set dbo.MyEmployee.TitleOfCourtesy='Dr'
where dbo.MyEmployee.City like 'london';

/**PART B**/

/**QUERY B1**/

select dbo.[Order Details].OrderID , dbo.Orders.OrderDate , dbo.Products.ProductID , dbo.Products.ProductName, dbo.[Order Details].Quantity , dbo.[Order Details].UnitPrice
from ((dbo.[Order Details]
inner join Products on dbo.[Order Details].ProductID=dbo.Products.ProductID)
inner join Orders on dbo.Orders.OrderID=dbo.[Order Details].OrderID)
order by dbo.Orders.OrderDate ASC;

/**QUERY B2**/
insert into dbo.Orders
(OrderID)
values (12001);

select dbo.Employees.EmployeeID , dbo.Orders.OrderID
from dbo.Employees
right join dbo.Orders on dbo.Orders.EmployeeID=dbo.Employees.EmployeeID
order by dbo.Employees.EmployeeID ASC;

/**QUERY B3**/
insert into dbo.Products
(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
values (80, 'pasta',8,5,4,0,0,0,0,1 );

select dbo.Products.ProductID ,dbo.Products.ProductName , dbo.[Order Details].UnitPrice
from Products
left join [Order Details] on dbo.[Order Details].ProductID=dbo.Products.ProductID


/**QUERY B4**/
insert into dbo.Customers
(CustomerID,CompanyName,Phone)
values (4,'DHL','0501234567');

select dbo.Customers.CustomerID, dbo.Customers.CompanyName , dbo.Orders.OrderDate , dbo.Orders.ShippedDate
from dbo.Customers
left join dbo.Orders on dbo.Customers.CustomerID=dbo.Orders.CustomerID;

/**QUERY B5**/

select dbo.Customers.CompanyName , dbo.Orders.OrderDate , dbo.Orders.ShippedDate
from dbo.Customers
full outer join dbo.Orders on dbo.Orders.CustomerID=dbo.Customers.CustomerID;