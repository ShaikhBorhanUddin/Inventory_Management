CREATE DATABASE inventory_management;

CREATE TABLE Product (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    CategoryName VARCHAR(100),
    ProductDescription TEXT,
    ProductStandardCost DECIMAL(10,2),
    ProductListPrice DECIMAL(10,2),
    Profit DECIMAL(10,2)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    CustomerEmail VARCHAR(255) UNIQUE,
    CustomerPhone VARCHAR(20),
    CustomerAddress TEXT,
    CustomerCreditLimit DECIMAL(10,2)
);

CREATE TABLE Region (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(100),
    CountryName VARCHAR(100),
    State VARCHAR(100),
    City VARCHAR(100),
    PostalCode VARCHAR(20)
);

CREATE TABLE Orders (
    OrderID VARCHAR(10) PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailsID INT PRIMARY KEY,
    ProductID VARCHAR(10),
	OrderItemQuantity INT NOT NULL,
	PerUnitPrice DECIMAL(10,2),
	OrderStatus VARCHAR(50),
	OrderID VARCHAR(10),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Warehouse (
    WarehouseID INT PRIMARY KEY,
    WarehouseName VARCHAR(255),
    WarehouseAddress TEXT,
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255) NOT NULL,
    EmployeeEmail VARCHAR(255) UNIQUE,
    EmployeePhone VARCHAR(20),
    EmployeeHireDate DATE,
    EmployeeJobTitle VARCHAR(100),
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

select * from Customer;

select * from Product;

select * from Region;

select * from Orders;

select * from Warehouse;

select * from Employee;

select * from OrderDetails;

-- Q1: What are the top 5 products with the highest total revenue, considering OrderItemQuantity and PerUnitPrice?

SELECT 
    p.ProductID, 
    p.ProductName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 5;

--Q2: Which customers have spent the most money, and what is their total spending? (Top 10 customers by total spending)

SELECT 
    c.CustomerID, 
    c.CustomerName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalSpending
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalSpending DESC
LIMIT 10;

--Q3: Which product category generates the top 3 highest total revenue?

SELECT 
    p.CategoryName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.CategoryName
ORDER BY TotalRevenue DESC
LIMIT 3;

--Q4: Which month had the highest total sales revenue?

SELECT 
    TO_CHAR(o.OrderDate, 'YYYY-MM') AS OrderMonth, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY OrderMonth
ORDER BY TotalRevenue DESC
LIMIT 1;

--Q5: Which warehouse has handled the highest total order quantity?

SELECT 
    w.WarehouseID, 
    w.WarehouseName, 
    SUM(od.OrderItemQuantity) AS TotalOrderQuantity
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
JOIN Warehouse w ON p.ProductID = p.ProductID
GROUP BY w.WarehouseID, w.WarehouseName
ORDER BY TotalOrderQuantity DESC
LIMIT 1;

--Q6: Which employee has processed the highest number of orders?

SELECT 
    e.EmployeeID, 
    e.EmployeeName, 
    COUNT(o.OrderID) AS TotalOrdersProcessed
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Employee e ON c.CustomerID = c.CustomerID
GROUP BY e.EmployeeID, e.EmployeeName
ORDER BY TotalOrdersProcessed DESC
LIMIT 1;

--Q7: What is the average order value (AOV) per customer?

SELECT 
    c.CustomerID, 
    c.CustomerName, 
    AVG(od.OrderItemQuantity * od.PerUnitPrice) AS AvgOrderValue
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY AvgOrderValue DESC;

--Q8: Which region generates the highest total revenue?

SELECT 
    r.RegionID, 
    r.RegionName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Region r ON c.CustomerAddress = r.City
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY r.RegionID, r.RegionName
ORDER BY TotalRevenue ASC
LIMIT 1;

-- Q9: Which product has the highest profit margin, and what is the margin percentage?

SELECT 
    ProductID, 
    ProductName, 
    ROUND((Profit / ProductStandardCost) * 100, 2) AS ProfitMarginPercentage
FROM Product
ORDER BY ProfitMarginPercentage DESC
LIMIT 1;

--Q10: Which day of the week has the highest total sales revenue?

SELECT 
    TO_CHAR(OrderDate, 'Day') AS DayOfWeek, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY DayOfWeek
ORDER BY TotalRevenue DESC
LIMIT 1;

--Q11: Which customers has placed the highest number of orders?

SELECT 
    c.CustomerID, 
    c.CustomerName, 
    COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalOrders DESC
LIMIT 5;

--Q12: Which employee has been working the longest (oldest hire date)?

SELECT 
    EmployeeID, 
    EmployeeName, 
    EmployeeHireDate
FROM Employee
ORDER BY EmployeeHireDate ASC
LIMIT 1;

--Q13: Which product category has generated the highest total revenue?

SELECT 
    p.CategoryName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.CategoryName
ORDER BY TotalRevenue DESC
LIMIT 1;

--Q14: Which warehouse has the highest total inventory cost (sum of ProductStandardCost for all stored products)?

SELECT 
    w.WarehouseID, 
    w.WarehouseName, 
    SUM(p.ProductStandardCost) AS TotalInventoryCost
FROM Warehouse w
JOIN Product p ON p.ProductID = p.ProductID
GROUP BY w.WarehouseID, w.WarehouseName
ORDER BY TotalInventoryCost DESC
LIMIT 1;

--Q15: Which product has the highest total quantity sold?

SELECT 
    p.ProductID, 
    p.ProductName, 
    SUM(od.OrderItemQuantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 1;

--Q16: List all Canceled orders.

SELECT 
    p.ProductID, 
    p.ProductName, 
    COUNT(od.OrderDetailsID) AS ReturnCount, 
    od.OrderStatus
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
WHERE od.OrderStatus IN ('Canceled')
GROUP BY p.ProductID, p.ProductName, od.OrderStatus
ORDER BY ReturnCount DESC;



