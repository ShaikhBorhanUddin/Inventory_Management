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

-- Q2: Which customers have spent the most money, and what is their total spending? (Top 10 customers by total spending)
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

-- Q5: What is the average order value (AOV) for top 15 customers?

SELECT 
    c.CustomerID, 
    c.CustomerName, 
    AVG(od.OrderItemQuantity * od.PerUnitPrice) AS AvgOrderValue
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY AvgOrderValue DESC
LIMIT 15;

-- Q6: Which product has the highest profit margin, and what is the margin percentage?

SELECT 
    ProductID, 
    ProductName, 
    ROUND((Profit / ProductStandardCost) * 100, 2) AS ProfitMarginPercentage
FROM Product
ORDER BY ProfitMarginPercentage DESC
LIMIT 1;

-- Q7: Which day of the week has the highest total sales revenue?

SELECT 
    TO_CHAR(OrderDate, 'Day') AS DayOfWeek, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY DayOfWeek
ORDER BY TotalRevenue DESC;

-- Q8: Which employees has been working the longest (oldest hire date)?

SELECT 
    EmployeeID, 
    EmployeeName, 
    EmployeeHireDate
FROM Employee
ORDER BY EmployeeHireDate ASC
LIMIT 10;

-- Q9: Which product has the highest total quantity sold and how much profit is generated?
SELECT 
    p.ProductID, 
    p.ProductName, 
    SUM(od.OrderItemQuantity) AS TotalQuantitySold,
    SUM(od.OrderItemQuantity * p.Profit) AS TotalProfit
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 10;

-- Q10: Show employee distribution among countries.

SELECT 
    r.CountryName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Warehouse w
JOIN Region r ON w.RegionID = r.RegionID
LEFT JOIN Employee e ON w.WarehouseID = e.WarehouseID
GROUP BY r.CountryName
ORDER BY EmployeeCount DESC;

-- Q11: Which employees were hired in the Last 10 Years?
SELECT 
    EmployeeID,
    EmployeeName,
    EmployeeJobTitle,
    EmployeeHireDate,
    w.WarehouseName
FROM Employee e
JOIN Warehouse w ON e.WarehouseID = w.WarehouseID
WHERE EmployeeHireDate >= CURRENT_DATE - INTERVAL '10 year';

-- Q12: Find Revenue Contribution by State and Country.
SELECT 
    r.CountryName,
    r.State,
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM Region r
JOIN Warehouse w ON r.RegionID = w.RegionID
JOIN Employee e ON w.WarehouseID = e.WarehouseID
JOIN Orders o ON o.CustomerID IS NOT NULL
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY r.CountryName, r.State
ORDER BY TotalRevenue DESC;

-- Q13: Display Warehouse Coverage by Country.
SELECT 
    r.CountryName,
    COUNT(DISTINCT w.WarehouseID) AS NumberOfWarehouses
FROM Region r
JOIN Warehouse w ON r.RegionID = w.RegionID
GROUP BY r.CountryName;
