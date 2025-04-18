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
# Q2: Which customers have spent the most money, and what is their total spending? (Top 10 customers by total spending)
## Solution
```SQL
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
```
## Output
|customerid|customername        |totalspending|
|----------|--------------------|-------------|
|2659      |Shields Seffi       |600155.00    |
|2546      |Bill Stein          |550487.00    |
|2604      |Daina Combs         |389855.70    |
|2573      |Mac Mckay           |344872.35    |
|2567      |Alessandra Estrada  |328038.42    |
|2401      |Samara Barnett      |323400.00    |
|2607      |Darron Robertson    |307683.51    |
|2456      |Glinda Lambert      |302398.88    |
|2513      |Herman Stokes       |300139.18    |
|2410      |Reva Fuller         |292382.07    |
## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%202.png?raw=true)
# Q3: Which product category generates the top 3 highest total revenue?
## Solution
```SQL
SELECT 
    p.CategoryName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.CategoryName
ORDER BY TotalRevenue DESC
LIMIT 3;
```
## Output
|categoryname|totalrevenue|
|------------|------------|
|Storage     |10712932.17 |
|Video Card  |5746481.52  |
|Mother Board|5555189.14  |
## Visualization
![dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%203.png?raw=true)
# Q4: Which month had the highest total sales revenue?
## Solution
```SQL
SELECT 
    TO_CHAR(o.OrderDate, 'YYYY-MM') AS OrderMonth, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY OrderMonth
ORDER BY TotalRevenue DESC
LIMIT 1;
```
## Output
|ordermonth|totalrevenue|
|----------|------------|
|2017-02   |4573355.78  |

# Q5: Which warehouse has handled the highest total order quantity?
## Solution
```SQL
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
```
## Output
|warehouseid|warehousename  |totalorderquantity|
|-----------|---------------|------------------|
|102        |Southlake Texas|35696             |
|103        |Southlake Texas|35696             |
|104        |Southlake Texas|35696             |
|105        |Southlake Texas|35696             |
|106        |Southlake Texas|35696             |
|107        |Southlake Texas|35696             |
|108        |Southlake Texas|35696             |
|109        |Southlake Texas|35696             |
|110        |Southlake Texas|35696             |
|101        |Southlake Texas|35696             |

# Q6: Which employee has processed the highest number of orders?
## Solution
```SQL
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
```
## Output
|employeeid|employeename|totalordersprocessed|
|----------|------------|--------------------|
|6309      |Summer Payne|400                 |

# Q7: What is the average order value (AOV) for top 15 customers?
## Solution
```SQL
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
```
## Output
|customerid|customername        |avgordervalue         |
|----------|--------------------|----------------------|
|2659      |Shields Seffi       |600155.000000000000   |
|2546      |Bill Stein          |550487.000000000000   |
|2604      |Daina Combs         |389855.700000000000   |
|2573      |Mac Mckay           |344872.350000000000   |
|2567      |Alessandra Estrada  |328038.420000000000   |
|2401      |Samara Barnett      |323400.000000000000   |
|2607      |Darron Robertson    |307683.510000000000   |
|2456      |Glinda Lambert      |302398.880000000000   |
|2513      |Herman Stokes       |300139.180000000000   |
|2410      |Reva Fuller         |292382.070000000000   |
|2318      |Maurice Mahoney     |289984.050000000000   |
|2568      |Sherron Flores      |275000.000000000000   |
|2492      |Maud Cohen          |266909.180000000000   |
|2378      |Elwood Hampton      |259421.630000000000   |
|2529      |Kandi Holden        |254598.660000000000   |

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%207.png?raw=true)
# Q8: Which product has the highest profit margin, and what is the margin percentage?
## Solution
```SQL
SELECT 
    ProductID, 
    ProductName, 
    ROUND((Profit / ProductStandardCost) * 100, 2) AS ProfitMarginPercentage
FROM Product
ORDER BY ProfitMarginPercentage DESC
LIMIT 1;
```
## Output
|productid|productname                          |profitmarginpercentage|
|---------|-------------------------------------|----------------------|
|P291     |Hynix (H15201504-8) Genuine DDR2 2 GB|66.89                 |

# Q9: Which day of the week has the highest total sales revenue?
## Solution
```SQL
SELECT 
    TO_CHAR(OrderDate, 'Day') AS DayOfWeek, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY DayOfWeek
ORDER BY TotalRevenue DESC
LIMIT 1;
```
## Output
|dayofweek|totalrevenue|
|---------|------------|
|Tuesday  |7816402.08  |

# Q10: Which customers has placed the highest number of orders?
## Solution
```SQL
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalOrders DESC
LIMIT 5;
```
## Output
|customerid|customername      |totalorders|
|----------|------------------|-----------|
|2557      |Blanche Robbins   |1          |
|2498      |Kina Larsen       |1          |
|2436      |Stacia Rutledge   |1          |
|2460      |Jamee Mclaughlin  |1          |
|2554      |Enriqueta Odom    |1          |
|2623      |Peters Lauren     |1          |
|2648      |Rossetti Bruno    |1          |
|2582      |Janey Burris      |1          |
|2468      |Sofia Burnett     |1          |
|2396      |Jon Petersen      |1          |

# Q11: Which employee has been working the longest (oldest hire date)?
## Solution
```SQL
SELECT 
    EmployeeID, 
    EmployeeName, 
    EmployeeHireDate
FROM Employee
ORDER BY EmployeeHireDate ASC
LIMIT 1;
```
## Output
|employeeid|employeename   |employeehiredate|
|----------|---------------|----------------|
|6708      |Volk Colleen   |2000-05-15      |

# Q12: Which product category has generated the highest total revenue?
## Solution
```SQL
SELECT 
    p.CategoryName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.CategoryName
ORDER BY TotalRevenue DESC
LIMIT 1;
```
## Output
|categoryname   |totalrevenue|
|---------------|------------|
|Storage        |10712932.17 |
|Video Card     |5746481.52  |
|Mother Board   |5555189.14  |
|CPU            |5366747.48  |
|RAM            |3138740.40  |

# Q13: Which warehouse has the highest total inventory cost (sum of ProductStandardCost for all stored products)?
## Solution
```SQL
SELECT 
    w.WarehouseID, 
    w.WarehouseName, 
    SUM(p.ProductStandardCost) AS TotalInventoryCost
FROM Warehouse w
JOIN Product p ON p.ProductID = p.ProductID
GROUP BY w.WarehouseID, w.WarehouseName
ORDER BY TotalInventoryCost DESC
LIMIT 1;
```
## Output
|warehouseid|warehousename     |totalinventorycost|
|-----------|------------------|------------------|
|101        |Southlake Texas   |725061.81         |

# Q14: Which product has the highest total quantity sold?
## Solution
```SQL
SELECT 
    p.ProductID, 
    p.ProductName, 
    SUM(od.OrderItemQuantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 1;
```
## Output
|productid|productname           |totalquantitysold|
|---------|----------------------|-----------------|
|P399     |Zotac ZT-P10810A-10P  |157              |

# Q15: List all Canceled orders.
## Solution
```SQL
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
```
## Output
|productid|productname                                   |returncount|orderstatus|
|---------|----------------------------------------------|-----------|-----------|
|P286     |Kingston  SV300S37A/120G                      |1          |Canceled   |
|P068     |Intel Xeon E5-2630 V2                         |1          |Canceled   |
|P313     |Transcend (TS512MLK64W6H) DDR3 4GB            |1          |Canceled   |
|P173     |G.Skill Ripjaws V Series                      |1          |Canceled   |
|P349     |Western Digital WD1003FZEX                    |1          |Canceled   |
|P086     |PNY VCQK5200-PB                               |1          |Canceled   |
|P112     |Zotac ZT-P10810D-10P                          |1          |Canceled   |
|P222     |MSI Z170A KRAIT GAMING 3X                     |1          |Canceled   |
|P076     |AMD FirePro W9100                             |1          |Canceled   |
|P229     |Asus VANGUARD B85                             |1          |Canceled   |
|P137     |Corsair Vengeance Pro                         |1          |Canceled   |
|P150     |G.Skill Trident Z                             |1          |Canceled   |
|P081     |HP C2J95AT                                    |1          |Canceled   |
|P335     |Intel Core i7-4960X Extreme Edition           |1          |Canceled   |
|P290     |Corsair Vengeance LPX (CMK8GX4M1A2400C16R) 8GB|1          |Canceled   |
|P353     |Samsung MZ-V6P1T0BW                           |1          |Canceled   |
|P260     |Western Digital WD1003FZEX                    |1          |Canceled   |
|P019     |Intel Xeon E5-2637 V2 (OEM/Tray)              |1          |Canceled   |
|P203     |MSI X299 GAMING M7 ACK                        |1          |Canceled   |
|P171     |G.Skill Trident X                             |1          |Canceled   |
|P251     |Samsung MZ-75E4T0B                            |1          |Canceled   |
|P324     |Intel Xeon E5-2643 V2 (OEM/Tray)              |1          |Canceled   |
|P083     |PNY VCQM5000-PB                               |1          |Canceled   |
|P268     |SanDisk SDSSDHII-240G-G25                     |1          |Canceled   |
|P337     |Intel Xeon E5-1680 V3 (OEM/Tray)              |1          |Canceled   |
|P214     |Asus Z170-WS                                  |1          |Canceled   |
|P161     |Corsair Vengeance LPX                         |1          |Canceled   |
|P326     |Intel Xeon E5-2687W V3                        |1          |Canceled   |
|P247     |Seagate ST3000DM008                           |1          |Canceled   |
|P159     |Corsair Vengeance LPX                         |1          |Canceled   |
|P380     |ASRock EP2C602-4L/D16                         |1          |Canceled   |
|P115     |Gigabyte GV-N98TWF3OC-6GD                     |1          |Canceled   |
|P281     |Crucial CT525MX300SSD4                        |1          |Canceled   |
|P271     |Crucial CT1050MX300SSD1                       |1          |Canceled   |
|P143     |G.Skill Trident Z                             |1          |Canceled   |
|P033     |Intel Xeon E5-2660 V3                         |1          |Canceled   |
|P189     |ASRock E3C224D4M-16RE                         |1          |Canceled   |
|P055     |Intel Xeon E5-2687W                           |1          |Canceled   |
|P343     |Samsung MZ-V6P512BW                           |1          |Canceled   |
|P300     |Kingston (KVR800D2N6K2) 4GB (2 x 2 GB) DDR2   |1          |Canceled   |
|P174     |G.Skill Ripjaws V Series                      |1          |Canceled   |
|P009     |Intel Xeon E5-2695 V2                         |1          |Canceled   |
|P303     |Adata XPG (AX3U1600W4G11-RD) 4GB              |1          |Canceled   |
|P278     |Crucial CT275MX300SSD1                        |1          |Canceled   |
|P235     |Supermicro X10SAT-O                           |1          |Canceled   |
|P358     |PNY SSD7CS1311-120-RB                         |1          |Canceled   |
|P257     |Seagate ST10000DM0004                         |1          |Canceled   |
|P105     |NVIDIA VCQM4000-PB                            |1          |Canceled   |
|P317     |Kingston KVR (KVR16N11/8-SP) 8 GB DDR3        |1          |Canceled   |
|P063     |Intel Core i7-4790K                           |1          |Canceled   |
|P051     |Intel Core i7-6900K (OEM/Tray)                |1          |Canceled   |
|P130     |Corsair Vengeance LPX                         |1          |Canceled   |
|P078     |AMD 100-505989                                |1          |Canceled   |
|P241     |Samsung MZ-75E500B/AM                         |1          |Canceled   |
|P328     |Intel Xeon E5-2667 V3 (OEM/Tray)              |1          |Canceled   |
|P038     |Intel Xeon E5-2650 V4                         |1          |Canceled   |
|P096     |MSI GAMING                                    |1          |Canceled   |
|P015     |Intel Xeon E5-2690 V4                         |1          |Canceled   |
|P007     |Intel Xeon E5-2697 V2                         |1          |Canceled   |
|P362     |Asus SABERTOOTH X99                           |1          |Canceled   |
|P234     |MSI X299 TOMAHAWK ARCTIC                      |1          |Canceled   |
|P146     |Kingston                                      |1          |Canceled   |
|P314     |Hynix 6671G DDR2 1GB                          |1          |Canceled   |
|P244     |SA400S37/120G                                 |1          |Canceled   |
|P374     |EVGA Z270 Classified K                        |1          |Canceled   |
|P232     |MSI Z270 XPOWER GAMING TITANIUM               |1          |Canceled   |
|P199     |Asus Z10PE-D16                                |1          |Canceled   |
|P210     |Asus MAXIMUS VIII EXTREME/ASSEMBLY            |1          |Canceled   |
|P385     |HP C2J95AT                                    |1          |Canceled   |
|P196     |Asus X99-DELUXE/U3.1                          |1          |Canceled   |
|P158     |G.Skill Ripjaws V Series                      |1          |Canceled   |
|P204     |Supermicro MBD-X10DRI-O                       |1          |Canceled   |
|P071     |PNY VCQP6000-PB                               |1          |Canceled   |
|P376     |MSI Z270 XPOWER GAMING TITANIUM               |1          |Canceled   |
|P307     |G.Skill RipjawsX (F3-1600C9Q-32GXM) DDR3 32 GB|1          |Canceled   |
|P140     |Crucial                                       |1          |Canceled   |
|P054     |Intel Core i7-4770K                           |1          |Canceled   |
|P003     |Intel Xeon E5-2698 V3 (OEM/Tray)              |1          |Canceled   |
|P369     |Asus MAXIMUS IX CODE                          |1          |Canceled   |
|P265     |Samsung MZ-7KE256BW                           |1          |Canceled   |
|P394     |PNY VCQK4200-PB                               |1          |Canceled   |
|P186     |Asus Rampage V Edition 10                     |1          |Canceled   |
|P156     |G.Skill Trident Z                             |1          |Canceled   |
|P388     |ATI FirePro S9050                             |1          |Canceled   |
|P169     |Corsair Dominator Platinum                    |1          |Canceled   |
|P365     |ASRock EP2C602-4L/D16                         |1          |Canceled   |
|P206     |Asus X99-DELUXE II                            |1          |Canceled   |
|P052     |AMD Opteron 6378                              |1          |Canceled   |
|P044     |Intel Core 2 Extreme QX6800                   |1          |Canceled   |
|P400     |MSI GAMING                                    |1          |Canceled   |
|P375     |EVGA Classified                               |1          |Canceled   |
|P124     |G.Skill Trident Z                             |1          |Canceled   |
|P295     |Samsung (M378T5263AZ3) 2GB DDR2               |1          |Canceled   |
|P183     |Asus Z10PE-D8 WS                              |1          |Canceled   |
|P339     |Intel Core i7-6950X (OEM/Tray)                |1          |Canceled   |
|P272     |Western Digital WDS250G1B0B                   |1          |Canceled   |
|P192     |Supermicro X9SRH-7TF                          |1          |Canceled   |
|P309     |Kingston HyperX FURY (HX318C10F/8) DDR3 8GB   |1          |Canceled   |
|P276     |Western Digital WD2500AVVS                    |1          |Canceled   |
|P398     |MSI GTX 1080 TI LIGHTNING X                   |1          |Canceled   |
|P153     |Corsair Dominator Platinum                    |1          |Canceled   |
|P391     |AMD FirePro S7000                             |1          |Canceled   |
|P175     |Kingston                                      |1          |Canceled   |
|P255     |Hitachi HUS724030ALE641                       |1          |Canceled   |
|P322     |Intel Xeon E5-2695 V4                         |1          |Canceled   |
|P240     |Samsung MZ-75E250B/AM                         |1          |Canceled   |
|P289     |HP (500203-061) 4GB DDR3                      |1          |Canceled   |
|P061     |Intel Xeon E5-2630 V3                         |1          |Canceled   |
|P026     |Intel Xeon E5-2670 V3                         |1          |Canceled   |
|P332     |Intel Xeon E5-2683 V4                         |1          |Canceled   |
|P101     |EVGA 11G-P4-6598-KR                           |1          |Canceled   |
