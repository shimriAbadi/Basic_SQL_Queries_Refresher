use NorthWind

//* query 1*//

select dbo.Suppliers.*
from dbo.Suppliers
where dbo.Suppliers.CompanyName like '%na%';

//* query 2 *//

select distinct dbo.Orders.OrderID , dbo.Orders.CustomerID , dbo.Employees.FirstName , dbo.Employees.LastName , dbo.Orders.OrderDate
from dbo.Orders , dbo.Employees
where dbo.Orders.EmployeeID=dbo.Employees.EmployeeID and  (dbo.Orders.Freight >= 50 and dbo.Orders.Freight <= 85) ; 

//* query 3*//
select dbo.Employees.EmployeeID , dbo.Employees.FirstName , dbo.Employees.LastName , count(dbo.Orders.EmployeeID) AS SamaryOfOrders , 
min (dbo.[Order Details].Quantity) ,  max (dbo.[Order Details].Quantity), avg (dbo.[Order Details].Quantity)
from dbo.Employees , dbo.Orders , dbo.[Order Details]
where dbo.Orders.EmployeeID = dbo.Employees.EmployeeID and dbo.[Order Details].OrderID=dbo.Orders.OrderID
group by dbo.Employees.EmployeeID , dbo.Employees.FirstName , dbo.Employees.LastName;

//* query 4 *//
select dbo.Products.ProductID , dbo.Products.ProductName , dbo.Products.UnitPrice
from dbo.Products, dbo.Suppliers
where dbo.Products.SupplierID=dbo.Suppliers.SupplierID and (dbo.Suppliers.Country like'usa' or dbo.Suppliers.Country like'germany') and (dbo.Products.UnitPrice<50);

//* query 5*//

select dbo.Customers.CustomerID , dbo.Customers.CompanyName , dbo.Customers.City , dbo.Customers.Region
from dbo.Customers
order by dbo.Customers.City ASC;

//* query 6 *//
select dbo.Employees.FirstName  , dbo.Employees.LastName
from dbo.Employees
where year(dbo.Employees.BirthDate) between 1960 and 1969;

//* query 7*//
select distinct dbo.Customers.CustomerID , dbo.Customers.CompanyName , count (dbo.Orders.OrderID) , avg(dbo.[Order Details].Quantity)
from dbo.Customers , dbo.[Order Details],dbo.Orders
where dbo.Customers.CustomerID=dbo.Orders.CustomerID and dbo.[Order Details].OrderID=dbo.Orders.OrderID
group by dbo.Customers.CustomerID , dbo.Customers.CompanyName , dbo.Orders.OrderID;

//* query 8*//

select dbo.Employees.EmployeeID , dbo.Employees.FirstName , dbo.Employees.LastName , AVG(dbo.Orders.Freight)
from dbo.Employees , dbo.Orders
where dbo.Employees.EmployeeID = dbo.Orders.EmployeeID and (dbo.Employees.City like 'seattle' or dbo.Employees.City like 'london')
group by dbo.Employees.EmployeeID, dbo.Employees.FirstName,dbo.Employees.LastName;

//* query 9*//

select dbo.Customers.CustomerID , dbo.Customers.CompanyName
from dbo.Customers
where dbo.Customers.Country like 'brazil';