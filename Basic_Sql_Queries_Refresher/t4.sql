use NorthWind

//* Query 1*//

select dbo.Employees.City,count (dbo.Employees.City) AS PeopleInCity
from dbo.Employees
group by dbo.Employees.City;

//* Query 2*//

select dbo.Orders.ShipCity,count (dbo.Orders.OrderID) ,max(dbo.orders.Freight)
from dbo.Orders
group by  dbo.Orders.ShipCity
having max(dbo.orders.Freight)<=100;
 
//* Query 3*//

select count(dbo.Employees.EmployeeID) AS CountEmp
from dbo.Employees
where (year(GETDATE())-year(dbo.Employees.BirthDate)<60 and (year(dbo.Employees.HireDate)-year(dbo.Employees.BirthDate)>=28));

//* Query 4*//

select dbo.Customers.CompanyName , min(dbo.Orders.Freight) AS MinFreight
from dbo.Customers,dbo.Orders,dbo.[Order Details]
where dbo.Customers.CustomerID=dbo.Orders.CustomerID and dbo.Orders.OrderID=dbo.[Order Details].OrderID
group by dbo.Customers.CompanyName
having Sum(dbo.[Order Details].UnitPrice * dbo.[Order Details].Quantity)>750;

//* Query 5*//

select dbo.Products.ProductName, SUM(dbo.[Order Details].Quantity), SUM(dbo.[Order Details].Quantity) * 1.05 AS NewQuantity
from dbo.Products, dbo.[Order Details]
where dbo.Products.ProductID = dbo.[Order Details].ProductID
group by dbo.Products.ProductName;

//* Query 6*//

select dbo.Employees.*
from dbo.Employees
where (dbo.Employees.LastName like '%l%' or dbo.Employees.LastName like '%c%') or (year(dbo.Employees.BirthDate)>=1960 or year(dbo.Employees.BirthDate)<1970)

//* Query 7*//

select dbo.Customers.CompanyName , min(dbo.Orders.Freight) AS MinFreight
from dbo.Customers,dbo.Orders,dbo.[Order Details]
where dbo.Customers.CustomerID=dbo.Orders.CustomerID and dbo.Orders.OrderID=dbo.[Order Details].OrderID
group by dbo.Customers.CompanyName
having (Sum(dbo.[Order Details].UnitPrice * dbo.[Order Details].Quantity)>750) and min(dbo.Orders.Freight)<10;

//* Query 8*//

select dbo.Employees.FirstName , dbo.Employees.LastName , count(dbo.Orders.OrderID)
from dbo.Employees ,dbo.Orders
where dbo.Orders.EmployeeID=dbo.Employees.EmployeeID 
group by dbo.Employees.FirstName , dbo.Employees.LastName , dbo.Employees.HireDate 
having year(getdate())-year(dbo.Employees.HireDate)>=8 and (count(dbo.Orders.EmployeeID)>=25);
