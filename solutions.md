# Q1: What are the top 5 products with the highest total revenue, considering OrderItemQuantity and PerUnitPrice?
## Solution
```SQL
SELECT 
    p.ProductID, 
    p.ProductName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 5;
```
## Output
|productid|productname                         |totalrevenue|
|---------|------------------------------------|------------|
|P359     |PNY SSD9SC240GMDA-RB                |600155.00   |
|P246     |Samsung MZ-V6E500                   |550487.00   |
|P304     |Kingston Fury (HX316C10FB/8) 8 GB   |389855.70   |
|P273     |Samsung MZ-75E120B/AM               |344872.35   |
|P267     |Western Digital WD5000AACS          |328038.42   |
## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%201.png?raw=true)
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
