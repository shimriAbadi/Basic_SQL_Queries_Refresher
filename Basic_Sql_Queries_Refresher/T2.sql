use NorthWind

/* question 1 */

select * 
from dbo.Customers;

/* question 2 */

select * 
from dbo.Products
where dbo.Products.UnitPrice >= 30 and dbo.Products.UnitPrice<=50;

/* question 3 */

select dbo.Products.ProductID , dbo.Products.UnitsInStock
from dbo.Products
where dbo.Products.UnitsOnOrder>50;

/* question 4 */

select dbo.Products.ProductID
from dbo.Products
where dbo.Products.UnitsInStock <=30;

/* question 5 */

select * 
from dbo.Employees
where dbo.Employees.Title like 'S%';

/* question 6 */

select * 
from dbo.Suppliers
where dbo.Suppliers.Fax is not null ;

/* question 7 */

select dbo.Orders.OrderID 
from dbo.Orders
where dbo.Orders.ShipRegion is null ;

/* question 8 */

select *
from dbo.Orders
where dbo.Orders.ShipVia=3 and dbo.Orders.Freight<50;

/* question 9 */

select dbo.Orders.* , dbo.Employees.FirstName , dbo.Employees.LastName
from dbo.Orders , dbo.Employees
order by dbo.Employees.EmployeeID ASC;


