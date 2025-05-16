# Q1: What are the top 5 products with the highest total revenue, considering OrderItemQuantity and PerUnitPrice?

The analytic question is crucial in the context of Business Intelligence (BI) because it enables data-driven decision-making related to product performance and profitability. By identifying which products contribute the most to overall revenue, businesses can prioritize inventory, optimize supply chain management, and tailor marketing strategies to promote high-performing items. This insight helps executives and managers allocate resources efficiently, forecast demand more accurately, and drive revenue growth by focusing on the most profitable product lines. In BI, such targeted analysis transforms raw transactional data into actionable business insights.

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
This SQL query identifies the **top 5 products that generate the highest total revenue** in the database. It does so by joining the `OrderDetails` table with the `Product` table using the `ProductID` key to access product names and prices. For each product, it calculates total revenue by multiplying the quantity of each item ordered (`OrderItemQuantity`) with its selling price (`PerUnitPrice`), and then summing this value across all orders. The `GROUP BY` clause groups the results by each product's ID and name to ensure accurate aggregation. Finally, the results are sorted in descending order of revenue using `ORDER BY TotalRevenue DESC`, and `LIMIT 5` returns only the top five highest-grossing products.

## Output
|productid|productname                         |totalrevenue|
|---------|------------------------------------|------------|
|P359     |PNY SSD9SC240GMDA-RB                |600155.00   |
|P246     |Samsung MZ-V6E500                   |550487.00   |
|P304     |Kingston Fury (HX316C10FB/8) 8 GB   |389855.70   |
|P273     |Samsung MZ-75E120B/AM               |344872.35   |
|P267     |Western Digital WD5000AACS          |328038.42   |

The analysis reveals that the **top 5 revenue-generating products** are primarily high-performance storage and memory devices. Leading the list is the **PNY SSD9SC240GMDA-RB**, generating over **$600,000** in total revenue, followed closely by **Samsung MZ-V6E500** with **$550,487**. Other top performers include **Kingston Fury 8 GB RAM**, another **Samsung SSD**, and a **Western Digital hard drive**. This suggests that **solid-state drives (SSDs)** and **memory products** are the most profitable categories, highlighting strong customer demand and potentially high margins in this segment. Such insights are valuable for optimizing inventory, pricing strategies, and marketing focus.

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%201.png?raw=true)

# Q2: Which customers have spent the most money, and what is their total spending? (Top 10 customers by total spending)

This analytic question is highly significant in Business Intelligence (BI) as it identifies the **top 10 highest-spending customers**, providing a clear view of the company's most valuable clients. Understanding who contributes the most to revenue helps businesses **personalize customer relationships**, prioritize service quality for high-value clients, and design targeted marketing or loyalty programs to retain them. It also assists in customer segmentation and lifetime value analysis, enabling strategic decisions that can boost customer satisfaction and profitability. In essence, this query supports revenue optimization by spotlighting the customer base that drives the business’s financial success.

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
This SQL query retrieves the **top 10 customers based on their total spending**. It joins the `Orders` table with the `Customer` table using `CustomerID` to associate each order with the respective customer, and further joins with the `OrderDetails` table using `OrderID` to access pricing and quantity information. For each customer, it calculates total spending by multiplying the quantity of each ordered item (`OrderItemQuantity`) by its unit price (`PerUnitPrice`) and summing the results. The `GROUP BY` clause aggregates spending per customer, and the results are ordered in descending order of `TotalSpending`, with `LIMIT 10` ensuring that only the top 10 spenders are returned.

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

The analysis highlights the **top 10 highest-spending customers**, with **Shields Seffi** leading the list at **$600,155**, followed by **Bill Stein** and **Daina Combs**, each contributing over **$389,000** in revenue. These customers represent the most financially valuable segment of the business, collectively spending over **$3.7 million**. The results underscore the importance of cultivating strong relationships with high-value clients through targeted offers, loyalty programs, and premium support. Identifying such key customers enables the business to focus retention efforts where they will have the greatest financial impact.

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%202.png?raw=true)

# Q3: Which product category generates the top 3 highest total revenue?

This analytic question is crucial for strategic product and inventory management, as it identifies the **top 3 product categories by total revenue**. Understanding which categories contribute most to overall sales enables businesses to make informed decisions about **stock prioritization, marketing investment, and product development**. It helps focus resources on high-performing segments while identifying underperforming ones for reevaluation. In the context of Business Intelligence (BI), such insights guide category-level performance tracking and support data-driven planning to **maximize profitability and market responsiveness**.

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
This SQL query determines the **top 3 product categories with the highest total revenue**. It joins the `OrderDetails` table with the `Product` table on `ProductID` to access category information for each ordered item. The query calculates revenue by multiplying the quantity of each item sold (`OrderItemQuantity`) by its unit price (`PerUnitPrice`) and then aggregating this value for each product category using `GROUP BY p.CategoryName`. The result is a ranked list of categories based on total revenue, sorted in descending order, with `LIMIT 3` returning only the top three. This helps identify the most financially successful product categories.

## Output
|categoryname|totalrevenue|
|------------|------------|
|Storage     |10712932.17 |
|Video Card  |5746481.52  |
|Mother Board|5555189.14  |

The analysis reveals that the **Storage** category leads in revenue generation with over **$10.7 million**, significantly outperforming other categories. **Video Cards** and **Mother Boards** follow with revenues of **$5.7 million** and **$5.5 million**, respectively. This indicates that storage products are the most in-demand and profitable, likely driven by consistent market needs for data capacity and speed. These insights are valuable for optimizing inventory, marketing focus, and sales strategies around the most lucrative product segments.

## Visualization
![dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%203.png?raw=true)

# Q4: Which month had the highest total sales revenue?

Identifying the month with the highest total sales revenue is vital for **seasonal trend analysis and sales forecasting** in Business Intelligence (BI). This insight helps businesses understand **when customer demand peaks**, enabling more effective planning for inventory, staffing, marketing campaigns, and logistics. By recognizing high-performing months, companies can replicate successful strategies during similar periods and better manage cash flow. Additionally, it aids in detecting seasonal patterns or promotional impacts, supporting data-driven decisions that enhance operational efficiency and revenue optimization throughout the year.

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
This SQL query identifies the **month with the highest total sales revenue**. It joins the `Orders` table with the `OrderDetails` table using the `OrderID` key to access detailed order information. The `OrderDate` is formatted as `'YYYY-MM'` using the `TO_CHAR` function to group revenue data by month. For each month, it calculates total revenue by multiplying the quantity of items ordered (`OrderItemQuantity`) by the unit price (`PerUnitPrice`) and summing these values. The query groups results by OrderMonth, orders them in descending order of revenue, and uses `LIMIT 1` to return only the month with the highest revenue.

## Output
|ordermonth|totalrevenue|
|----------|------------|
|2017-02   |4573355.78  |

The analysis shows that **February 2017** was the **most profitable month**, generating approximately **$4.57 million** in total revenue. This peak could be attributed to factors such as seasonal demand, promotional events, product launches, or bulk corporate purchases. Identifying such high-performing periods allows businesses to replicate successful sales strategies, plan inventory and staffing needs more effectively, and maximize future revenue by aligning marketing efforts with proven demand cycles.

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

Understanding the Average Order Value (AOV) of top customers is a crucial metric in Business Intelligence (BI) as it helps businesses evaluate customer spending behavior and purchasing patterns. A high AOV from specific customers can indicate strong buying intent, brand loyalty, or successful upselling strategies. By identifying and analyzing the top 15 customers with the highest AOV, companies can refine marketing efforts, design personalized loyalty programs, and optimize sales strategies to boost revenue. This metric also supports strategic decision-making around pricing, promotions, and customer segmentation.

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
This SQL query calculates the **Average Order Value (AOV)** for each customer and retrieves the top 15 customers with the highest AOV. It joins three tables: `Orders`, `Customer`, and `OrderDetails`. The join connects customer IDs to their orders and links each order to its detailed items. The query computes the average value of all order items for each customer by multiplying the quantity of items ordered (`OrderItemQuantity`) with their unit price (`PerUnitPrice`) and applying the `AVG` function. The results are grouped by customer and sorted in descending order of AOV, returning the top 15 highest-spending customers by average transaction value.

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

The output reveals the **top 15 customers with the highest Average Order Value (AOV)**, highlighting those who spend the most per transaction. Leading the list is **Shields Seffi**, with an exceptionally high AOV of **600,155**, followed closely by **Bill Stein** and **Daina Combs**, with AOVs of **550,487** and **389,855.70**, respectively. These figures indicate that these customers consistently make high-value purchases, making them critical to business revenue. Identifying such high-value customers allows businesses to implement targeted marketing, loyalty programs, or personalized services to further boost retention and maximize revenue from this profitable segment.

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%207mod.png?raw=true)

# Q8: Which product has the highest profit margin, and what is the margin percentage?

Understanding which product has the **highest profit margin** is essential in business intelligence because it directly informs profitability strategies. While total revenue shows which products sell the most, profit margin reveals which ones **yield the highest return per sale**. Identifying high-margin products helps businesses **prioritize marketing**, **inventory**, and **resource allocation** toward items that drive the most profit relative to cost. This insight supports strategic decision-making around product pricing, promotion, and portfolio optimization, ultimately enhancing overall financial performance and long-term growth.

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
This SQL query identifies the **product with the highest profit margin percentage**. It selects the `ProductID`, `ProductName`, and calculates the profit margin as a percentage by dividing the `Profit` by the `ProductStandardCost` and multiplying the result by 100. The `ROUND` function is used to round the margin percentage to two decimal places for better readability. The `ORDER BY` clause sorts the products in descending order based on their calculated `ProfitMarginPercentage`, and the `LIMIT 1` ensures that only the top product with the **highest margin** is returned. This analysis helps determine which product yields the **most efficient** profit relative to its cost.

## Output
|productid|productname                          |profitmarginpercentage|
|---------|-------------------------------------|----------------------|
|P291     |Hynix (H15201504-8) Genuine DDR2 2 GB|66.89                 |

The result shows that the product **Hynix (H15201504-8) Genuine DDR2 2 GB** has the **highest profit margin percentage of 66.89%** among all products in the dataset. This means that for every dollar spent on the standard cost of this product, the company earns approximately **$0.67** in profit. A high profit margin like this indicates the product is either priced significantly above its cost or produced at a very low cost while still maintaining a strong market price. This insight is valuable in business intelligence for **prioritizing profitable items in marketing, inventory, and sales strategies**.

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

# Q16: Which orders were cancelled?
## Solution
```sql
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

# Q17: List number of employees per Warehouse with Country Name.
## Solution
```sql
SELECT 
    w.WarehouseID,
    w.WarehouseName,
    r.CountryName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Warehouse w
JOIN Region r ON w.RegionID = r.RegionID
LEFT JOIN Employee e ON w.WarehouseID = e.WarehouseID
GROUP BY w.WarehouseID, w.WarehouseName, r.CountryName
ORDER BY EmployeeCount DESC;
```
## Output
|warehouseid|warehousename     |countryname              |employeecount|
|-----------|------------------|-------------------------|-------------|
|428        |Beijing           |China                    |1            |
|279        |Toronto           |Canada                   |1            |
|364        |Sydney            |Australia                |1            |
|202        |New Jersy         |United States of America |1            |
|358        |Sydney            |Australia                |1            |
|300        |Toronto           |Canada                   |1            |
|455        |Beijing           |China                    |1            |
|152        |San Francisco     |United States of America |1            |
|190        |New Jersy         |United States of America |1            |
|322        |Toronto           |Canada                   |1            |
|444        |Beijing           |China                    |1            |
|409        |Mexico City       |Mexico                   |1            |
|353        |Sydney            |Australia                |1            |
|466        |Bombay            |India                    |1            |
|104        |Southlake Texas   |United States of America |1            |
|395        |Mexico City       |Mexico                   |1            |
|369        |Mexico City       |Mexico                   |1            |
|339        |Sydney            |Australia                |1            |
|285        |Toronto           |Canada                   |1            |
|172        |San Francisco     |United States of America |1            |
|495        |Bombay            |India                    |1            |
|213        |New Jersy         |United States of America |1            |
|219        |New Jersy         |United States of America |1            |
|140        |Southlake Texas   |United States of America |1            |
|497        |Bombay            |India                    |1            |
|116        |Southlake Texas   |United States of America |1            |
|110        |Southlake Texas   |United States of America |1            |
|119        |Southlake Texas   |United States of America |1            |
|410        |Mexico City       |Mexico                   |1            |
|138        |Southlake Texas   |United States of America |1            |
|424        |Beijing           |China                    |1            |
|124        |Southlake Texas   |United States of America |1            |
|403        |Mexico City       |Mexico                   |1            |
|295        |Toronto           |Canada                   |1            |
|270        |Seattle Washington|United States of America |1            |
|335        |Sydney            |Australia                |1            |
|242        |Seattle Washington|United States of America |1            |
|113        |Southlake Texas   |United States of America |1            |
|336        |Sydney            |Australia                |1            |
|456        |Beijing           |China                    |1            |
|289        |Toronto           |Canada                   |1            |
|257        |Seattle Washington|United States of America |1            |
|215        |New Jersy         |United States of America |1            |
|129        |Southlake Texas   |United States of America |1            |
|189        |New Jersy         |United States of America |1            |
|122        |Southlake Texas   |United States of America |1            |
|393        |Mexico City       |Mexico                   |1            |
|167        |San Francisco     |United States of America |1            |
|209        |New Jersy         |United States of America |1            |
|404        |Mexico City       |Mexico                   |1            |
|385        |Mexico City       |Mexico                   |1            |
|469        |Bombay            |India                    |1            |
|191        |New Jersy         |United States of America |1            |
|446        |Beijing           |China                    |1            |
|365        |Sydney            |Australia                |1            |
|391        |Mexico City       |Mexico                   |1            |
|363        |Sydney            |Australia                |1            |
|435        |Beijing           |China                    |1            |
|485        |Bombay            |India                    |1            |
|280        |Toronto           |Canada                   |1            |
|412        |Mexico City       |Mexico                   |1            |
|184        |San Francisco     |United States of America |1            |
|127        |Southlake Texas   |United States of America |1            |
|414        |Beijing           |China                    |1            |
|187        |San Francisco     |United States of America |1            |
|158        |San Francisco     |United States of America |1            |
|214        |New Jersy         |United States of America |1            |
|411        |Mexico City       |Mexico                   |1            |
|383        |Mexico City       |Mexico                   |1            |
|355        |Sydney            |Australia                |1            |
|264        |Seattle Washington|United States of America |1            |
|259        |Seattle Washington|United States of America |1            |
|376        |Mexico City       |Mexico                   |1            |
|123        |Southlake Texas   |United States of America |1            |
|115        |Southlake Texas   |United States of America |1            |
|405        |Mexico City       |Mexico                   |1            |
|106        |Southlake Texas   |United States of America |1            |
|465        |Bombay            |India                    |1            |
|296        |Toronto           |Canada                   |1            |
|164        |San Francisco     |United States of America |1            |
|126        |Southlake Texas   |United States of America |1            |
|200        |New Jersy         |United States of America |1            |
|313        |Toronto           |Canada                   |1            |
|120        |Southlake Texas   |United States of America |1            |
|492        |Bombay            |India                    |1            |
|344        |Sydney            |Australia                |1            |
|316        |Toronto           |Canada                   |1            |
|275        |Seattle Washington|United States of America |1            |
|246        |Seattle Washington|United States of America |1            |
|432        |Beijing           |China                    |1            |
|338        |Sydney            |Australia                |1            |
|451        |Beijing           |China                    |1            |
|416        |Beijing           |China                    |1            |
|207        |New Jersy         |United States of America |1            |
|486        |Bombay            |India                    |1            |
|476        |Bombay            |India                    |1            |
|453        |Beijing           |China                    |1            |
|327        |Sydney            |Australia                |1            |
|413        |Beijing           |China                    |1            |
|362        |Sydney            |Australia                |1            |
|160        |San Francisco     |United States of America |1            |
|250        |Seattle Washington|United States of America |1            |
|406        |Mexico City       |Mexico                   |1            |
|379        |Mexico City       |Mexico                   |1            |
|229        |New Jersy         |United States of America |1            |
|221        |New Jersy         |United States of America |1            |
|449        |Beijing           |China                    |1            |
|448        |Beijing           |China                    |1            |
|330        |Sydney            |Australia                |1            |
|183        |San Francisco     |United States of America |1            |
|192        |New Jersy         |United States of America |1            |
|198        |New Jersy         |United States of America |1            |
|408        |Mexico City       |Mexico                   |1            |
|329        |Sydney            |Australia                |1            |
|235        |Seattle Washington|United States of America |1            |
|169        |San Francisco     |United States of America |1            |
|118        |Southlake Texas   |United States of America |1            |
|177        |San Francisco     |United States of America |1            |
|278        |Seattle Washington|United States of America |1            |
|268        |Seattle Washington|United States of America |1            |
|220        |New Jersy         |United States of America |1            |
|480        |Bombay            |India                    |1            |
|373        |Mexico City       |Mexico                   |1            |
|356        |Sydney            |Australia                |1            |
|484        |Bombay            |India                    |1            |
|228        |New Jersy         |United States of America |1            |
|176        |San Francisco     |United States of America |1            |
|163        |San Francisco     |United States of America |1            |
|185        |San Francisco     |United States of America |1            |
|394        |Mexico City       |Mexico                   |1            |
|287        |Toronto           |Canada                   |1            |
|255        |Seattle Washington|United States of America |1            |
|302        |Toronto           |Canada                   |1            |
|459        |Bombay            |India                    |1            |
|496        |Bombay            |India                    |1            |
|265        |Seattle Washington|United States of America |1            |
|261        |Seattle Washington|United States of America |1            |
|130        |Southlake Texas   |United States of America |1            |
|481        |Bombay            |India                    |1            |
|397        |Mexico City       |Mexico                   |1            |
|134        |Southlake Texas   |United States of America |1            |
|151        |San Francisco     |United States of America |1            |
|298        |Toronto           |Canada                   |1            |
|269        |Seattle Washington|United States of America |1            |
|193        |New Jersy         |United States of America |1            |
|390        |Mexico City       |Mexico                   |1            |
|232        |New Jersy         |United States of America |1            |
|157        |San Francisco     |United States of America |1            |
|223        |New Jersy         |United States of America |1            |
|262        |Seattle Washington|United States of America |1            |
|271        |Seattle Washington|United States of America |1            |
|374        |Mexico City       |Mexico                   |1            |
|490        |Bombay            |India                    |1            |
|260        |Seattle Washington|United States of America |1            |
|143        |Southlake Texas   |United States of America |1            |
|479        |Bombay            |India                    |1            |
|112        |Southlake Texas   |United States of America |1            |
|286        |Toronto           |Canada                   |1            |
|111        |Southlake Texas   |United States of America |1            |
|326        |Sydney            |Australia                |1            |
|321        |Toronto           |Canada                   |1            |
|299        |Toronto           |Canada                   |1            |
|128        |Southlake Texas   |United States of America |1            |
|154        |San Francisco     |United States of America |1            |
|334        |Sydney            |Australia                |1            |
|305        |Toronto           |Canada                   |1            |
|234        |Seattle Washington|United States of America |1            |
|291        |Toronto           |Canada                   |1            |
|224        |New Jersy         |United States of America |1            |
|304        |Toronto           |Canada                   |1            |
|175        |San Francisco     |United States of America |1            |
|332        |Sydney            |Australia                |1            |
|227        |New Jersy         |United States of America |1            |
|248        |Seattle Washington|United States of America |1            |
|371        |Mexico City       |Mexico                   |1            |
|468        |Bombay            |India                    |1            |
|101        |Southlake Texas   |United States of America |1            |
|457        |Beijing           |China                    |1            |
|361        |Sydney            |Australia                |1            |
|231        |New Jersy         |United States of America |1            |
|380        |Mexico City       |Mexico                   |1            |
|108        |Southlake Texas   |United States of America |1            |
|384        |Mexico City       |Mexico                   |1            |
|137        |Southlake Texas   |United States of America |1            |
|396        |Mexico City       |Mexico                   |1            |
|434        |Beijing           |China                    |1            |
|133        |Southlake Texas   |United States of America |1            |
|461        |Bombay            |India                    |1            |
|458        |Bombay            |India                    |1            |
|431        |Beijing           |China                    |1            |
|159        |San Francisco     |United States of America |1            |
|382        |Mexico City       |Mexico                   |1            |
|341        |Sydney            |Australia                |1            |
|325        |Sydney            |Australia                |1            |
|489        |Bombay            |India                    |1            |
|136        |Southlake Texas   |United States of America |1            |
|148        |San Francisco     |United States of America |1            |
|218        |New Jersy         |United States of America |1            |
|482        |Bombay            |India                    |1            |
|281        |Toronto           |Canada                   |1            |
|474        |Bombay            |India                    |1            |
|323        |Sydney            |Australia                |1            |
|240        |Seattle Washington|United States of America |1            |
|450        |Beijing           |China                    |1            |
|182        |San Francisco     |United States of America |1            |
|243        |Seattle Washington|United States of America |1            |
|422        |Beijing           |China                    |1            |
|283        |Toronto           |Canada                   |1            |
|423        |Beijing           |China                    |1            |
|196        |New Jersy         |United States of America |1            |
|342        |Sydney            |Australia                |1            |
|483        |Bombay            |India                    |1            |
|389        |Mexico City       |Mexico                   |1            |
|478        |Bombay            |India                    |1            |
|372        |Mexico City       |Mexico                   |1            |
|166        |San Francisco     |United States of America |1            |
|387        |Mexico City       |Mexico                   |1            |
|245        |Seattle Washington|United States of America |1            |
|301        |Toronto           |Canada                   |1            |
|180        |San Francisco     |United States of America |1            |
|494        |Bombay            |India                    |1            |
|433        |Beijing           |China                    |1            |
|477        |Bombay            |India                    |1            |
|254        |Seattle Washington|United States of America |1            |
|427        |Beijing           |China                    |1            |
|415        |Beijing           |China                    |1            |
|233        |New Jersy         |United States of America |1            |
|131        |Southlake Texas   |United States of America |1            |
|351        |Sydney            |Australia                |1            |
|165        |San Francisco     |United States of America |1            |
|253        |Seattle Washington|United States of America |1            |
|337        |Sydney            |Australia                |1            |
|426        |Beijing           |China                    |1            |
|294        |Toronto           |Canada                   |1            |
|194        |New Jersy         |United States of America |1            |
|181        |San Francisco     |United States of America |1            |
|419        |Beijing           |China                    |1            |
|347        |Sydney            |Australia                |1            |
|441        |Beijing           |China                    |1            |
|467        |Bombay            |India                    |1            |
|277        |Seattle Washington|United States of America |1            |
|498        |Bombay            |India                    |1            |
|121        |Southlake Texas   |United States of America |1            |
|314        |Toronto           |Canada                   |1            |
|114        |Southlake Texas   |United States of America |1            |
|178        |San Francisco     |United States of America |1            |
|333        |Sydney            |Australia                |1            |
|241        |Seattle Washington|United States of America |1            |
|204        |New Jersy         |United States of America |1            |
|430        |Beijing           |China                    |1            |
|290        |Toronto           |Canada                   |1            |
|210        |New Jersy         |United States of America |1            |
|420        |Beijing           |China                    |1            |
|417        |Beijing           |China                    |1            |
|388        |Mexico City       |Mexico                   |1            |
|125        |Southlake Texas   |United States of America |1            |
|315        |Toronto           |Canada                   |1            |
|293        |Toronto           |Canada                   |1            |
|288        |Toronto           |Canada                   |1            |
|292        |Toronto           |Canada                   |1            |
|139        |Southlake Texas   |United States of America |1            |
|272        |Seattle Washington|United States of America |1            |
|328        |Sydney            |Australia                |1            |
|162        |San Francisco     |United States of America |1            |
|282        |Toronto           |Canada                   |1            |
|147        |San Francisco     |United States of America |1            |
|102        |Southlake Texas   |United States of America |1            |
|170        |San Francisco     |United States of America |1            |
|237        |Seattle Washington|United States of America |1            |
|244        |Seattle Washington|United States of America |1            |
|252        |Seattle Washington|United States of America |1            |
|318        |Toronto           |Canada                   |1            |
|306        |Toronto           |Canada                   |1            |
|439        |Beijing           |China                    |1            |
|179        |San Francisco     |United States of America |1            |
|462        |Bombay            |India                    |1            |
|307        |Toronto           |Canada                   |1            |
|472        |Bombay            |India                    |1            |
|407        |Mexico City       |Mexico                   |1            |
|352        |Sydney            |Australia                |1            |
|249        |Seattle Washington|United States of America |1            |
|487        |Bombay            |India                    |1            |
|367        |Sydney            |Australia                |1            |
|460        |Bombay            |India                    |1            |
|443        |Beijing           |China                    |1            |
|173        |San Francisco     |United States of America |1            |
|206        |New Jersy         |United States of America |1            |
|203        |New Jersy         |United States of America |1            |
|308        |Toronto           |Canada                   |1            |
|442        |Beijing           |China                    |1            |
|375        |Mexico City       |Mexico                   |1            |
|230        |New Jersy         |United States of America |1            |
|350        |Sydney            |Australia                |1            |
|171        |San Francisco     |United States of America |1            |
|312        |Toronto           |Canada                   |1            |
|216        |New Jersy         |United States of America |1            |
|153        |San Francisco     |United States of America |1            |
|105        |Southlake Texas   |United States of America |1            |
|402        |Mexico City       |Mexico                   |1            |
|217        |New Jersy         |United States of America |1            |
|199        |New Jersy         |United States of America |1            |
|142        |Southlake Texas   |United States of America |1            |
|377        |Mexico City       |Mexico                   |1            |
|251        |Seattle Washington|United States of America |1            |
|471        |Bombay            |India                    |1            |
|317        |Toronto           |Canada                   |1            |
|473        |Bombay            |India                    |1            |
|340        |Sydney            |Australia                |1            |
|440        |Beijing           |China                    |1            |
|311        |Toronto           |Canada                   |1            |
|309        |Toronto           |Canada                   |1            |
|107        |Southlake Texas   |United States of America |1            |
|103        |Southlake Texas   |United States of America |1            |
|267        |Seattle Washington|United States of America |1            |
|247        |Seattle Washington|United States of America |1            |
|488        |Bombay            |India                    |1            |
|436        |Beijing           |China                    |1            |
|491        |Bombay            |India                    |1            |
|197        |New Jersy         |United States of America |1            |
|146        |San Francisco     |United States of America |1            |
|360        |Sydney            |Australia                |1            |
|429        |Beijing           |China                    |1            |
|425        |Beijing           |China                    |1            |
|284        |Toronto           |Canada                   |1            |
|149        |San Francisco     |United States of America |1            |
|208        |New Jersy         |United States of America |1            |
|211        |New Jersy         |United States of America |1            |
|161        |San Francisco     |United States of America |1            |
|438        |Beijing           |China                    |1            |
|445        |Beijing           |China                    |1            |
|399        |Mexico City       |Mexico                   |1            |
|135        |Southlake Texas   |United States of America |1            |
|331        |Sydney            |Australia                |1            |
|297        |Toronto           |Canada                   |1            |
|452        |Beijing           |China                    |1            |
|117        |Southlake Texas   |United States of America |1            |
|401        |Mexico City       |Mexico                   |1            |
|349        |Sydney            |Australia                |1            |
|168        |San Francisco     |United States of America |1            |
|222        |New Jersy         |United States of America |1            |
|400        |Mexico City       |Mexico                   |1            |
|324        |Sydney            |Australia                |1            |
|378        |Mexico City       |Mexico                   |1            |
|274        |Seattle Washington|United States of America |1            |
|398        |Mexico City       |Mexico                   |1            |
|310        |Toronto           |Canada                   |1            |
|258        |Seattle Washington|United States of America |1            |
|109        |Southlake Texas   |United States of America |1            |
|225        |New Jersy         |United States of America |1            |
|320        |Toronto           |Canada                   |1            |
|366        |Sydney            |Australia                |1            |
|156        |San Francisco     |United States of America |1            |
|155        |San Francisco     |United States of America |1            |
|470        |Bombay            |India                    |1            |
|303        |Toronto           |Canada                   |1            |
|144        |Southlake Texas   |United States of America |1            |
|346        |Sydney            |Australia                |1            |
|463        |Bombay            |India                    |1            |
|386        |Mexico City       |Mexico                   |1            |
|447        |Beijing           |China                    |1            |
|212        |New Jersy         |United States of America |1            |
|357        |Sydney            |Australia                |1            |
|475        |Bombay            |India                    |1            |
|238        |Seattle Washington|United States of America |1            |
|186        |San Francisco     |United States of America |1            |
|195        |New Jersy         |United States of America |1            |
|145        |San Francisco     |United States of America |1            |
|343        |Sydney            |Australia                |1            |
|205        |New Jersy         |United States of America |1            |
|370        |Mexico City       |Mexico                   |1            |
|368        |Mexico City       |Mexico                   |1            |
|421        |Beijing           |China                    |1            |
|236        |Seattle Washington|United States of America |1            |
|141        |Southlake Texas   |United States of America |1            |
|418        |Beijing           |China                    |1            |
|239        |Seattle Washington|United States of America |1            |
|359        |Sydney            |Australia                |1            |
|132        |Southlake Texas   |United States of America |1            |
|256        |Seattle Washington|United States of America |1            |
|319        |Toronto           |Canada                   |1            |
|201        |New Jersy         |United States of America |1            |
|493        |Bombay            |India                    |1            |
|345        |Sydney            |Australia                |1            |
|150        |San Francisco     |United States of America |1            |
|381        |Mexico City       |Mexico                   |1            |
|464        |Bombay            |India                    |1            |
|266        |Seattle Washington|United States of America |1            |
|437        |Beijing           |China                    |1            |
|354        |Sydney            |Australia                |1            |
|392        |Mexico City       |Mexico                   |1            |
|276        |Seattle Washington|United States of America |1            |
|263        |Seattle Washington|United States of America |1            |
|226        |New Jersy         |United States of America |1            |
|348        |Sydney            |Australia                |1            |
|500        |Bombay            |India                    |1            |
|499        |Bombay            |India                    |1            |
|174        |San Francisco     |United States of America |1            |
|273        |Seattle Washington|United States of America |1            |
|188        |San Francisco     |United States of America |1            |
|454        |Beijing           |China                    |1            |

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2017b.png?raw=true)

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2017a.png?raw=true)

# Q18: Which employees were hired in the Last 10 Years?
## Solution
```sql
SELECT 
    EmployeeID,
    EmployeeName,
    EmployeeJobTitle,
    EmployeeHireDate,
    w.WarehouseName
FROM Employee e
JOIN Warehouse w ON e.WarehouseID = w.WarehouseID
WHERE EmployeeHireDate >= CURRENT_DATE - INTERVAL '10 year';
```
## Output
|employeeid|employeename        |employeejobtitle               |employeehiredate|warehousename     |
|----------|--------------------|-------------------------------|----------------|------------------|
|6309      |Summer Payne        |Public Accountant              |2016-06-07      |Southlake Texas   |
|6310      |Rose Stephens       |Accounting Manager             |2016-06-07      |Southlake Texas   |
|6311      |Annabelle Dunn      |Administration Assistant       |2016-09-17      |Southlake Texas   |
|6312      |Tommy Bailey        |President                      |2016-06-17      |Southlake Texas   |
|6313      |Blake Cooper        |Administration Vice President  |2016-01-13      |Southlake Texas   |
|6314      |Jude Rivera         |Administration Vice President  |2016-09-21      |Southlake Texas   |
|6315      |Tyler Ramirez       |Accountant                     |2016-09-28      |Southlake Texas   |
|6316      |Ryan Gray           |Accountant                     |2016-08-16      |Southlake Texas   |
|6317      |Elliot Brooks       |Accountant                     |2016-12-07      |Southlake Texas   |
|6318      |Elliott James       |Accountant                     |2016-09-30      |Southlake Texas   |
|6319      |Albert Watson       |Accountant                     |2016-03-07      |Southlake Texas   |
|6320      |Mohammad Peterson   |Finance Manager                |2016-08-17      |Southlake Texas   |
|6321      |Harper Spencer      |Human Resources Representative |2016-06-07      |Southlake Texas   |
|6322      |Louie Richardson    |Programmer                     |2016-01-03      |Southlake Texas   |
|6323      |Nathan Cox          |Programmer                     |2016-05-21      |Southlake Texas   |
|6324      |Bobby Torres        |Programmer                     |2016-02-07      |Southlake Texas   |
|6325      |Charles Ward        |Programmer                     |2016-02-05      |Southlake Texas   |
|6326      |Gabriel Howard      |Programmer                     |2016-06-25      |Southlake Texas   |
|6327      |Emma Perkins        |Marketing Manager              |2016-02-17      |Southlake Texas   |
|6328      |Amelie Hudson       |Marketing Representative       |2016-08-17      |Southlake Texas   |
|6329      |Gracie Gardner      |Public Relations Representative|2016-06-07      |Southlake Texas   |
|6330      |Frederick Price     |Purchasing Clerk               |2016-12-24      |Southlake Texas   |
|6331      |Alex Sanders        |Purchasing Clerk               |2016-05-18      |Southlake Texas   |
|6332      |Ollie Bennett       |Purchasing Clerk               |2016-07-24      |Southlake Texas   |
|6333      |Louis Wood          |Purchasing Clerk               |2016-11-15      |Southlake Texas   |
|6334      |Dexter Barnes       |Purchasing Clerk               |2016-08-10      |Southlake Texas   |
|6335      |Rory Kelly          |Purchasing Manager             |2016-12-07      |Southlake Texas   |
|6336      |Isabella Cole       |Sales Manager                  |2016-10-15      |Southlake Texas   |
|6337      |Jessica Woods       |Sales Manager                  |2016-03-10      |Southlake Texas   |
|6338      |Ella Wallace        |Sales Manager                  |2016-01-05      |Southlake Texas   |
|6339      |Ava Sullivan        |Sales Manager                  |2016-10-01      |Southlake Texas   |
|6340      |Mia West            |Sales Manager                  |2016-01-29      |Southlake Texas   |
|6341      |Evie Harrison       |Sales Representative           |2016-11-23      |Southlake Texas   |
|6342      |Scarlett Gibson     |Sales Representative           |2016-01-30      |Southlake Texas   |
|6343      |Ruby Mcdonald       |Sales Representative           |2016-03-04      |Southlake Texas   |
|6344      |Chloe Cruz          |Sales Representative           |2016-08-01      |Southlake Texas   |
|6345      |Isabelle Marshall   |Sales Representative           |2016-03-10      |Southlake Texas   |
|6346      |Daisy Ortiz         |Sales Representative           |2016-12-15      |Southlake Texas   |
|6347      |Freya Gomez         |Sales Representative           |2016-11-03      |Southlake Texas   |
|6348      |Elizabeth Dixon     |Sales Representative           |2016-01-04      |Southlake Texas   |
|6349      |Florence Freeman    |Sales Representative           |2016-03-19      |Southlake Texas   |
|6350      |Alice Wells         |Sales Representative           |2016-01-24      |Southlake Texas   |
|6351      |Charlotte Webb      |Sales Representative           |2016-02-23      |Southlake Texas   |
|6352      |Sienna Simpson      |Sales Representative           |2016-03-24      |Southlake Texas   |
|6353      |Matilda Stevens     |Sales Representative           |2016-04-21      |San Francisco     |
|6354      |Evelyn Tucker       |Sales Representative           |2016-03-11      |San Francisco     |
|6355      |Eva Porter          |Sales Representative           |2016-03-23      |San Francisco     |
|6356      |Millie Hunter       |Sales Representative           |2016-01-24      |San Francisco     |
|6357      |Sofia Hicks         |Sales Representative           |2016-02-23      |San Francisco     |
|6358      |Lucy Crawford       |Sales Representative           |2016-03-24      |San Francisco     |
|6359      |Elsie Henry         |Sales Representative           |2016-04-21      |San Francisco     |
|6360      |Imogen Boyd         |Sales Representative           |2016-05-11      |San Francisco     |
|6361      |Layla Mason         |Sales Representative           |2016-03-19      |San Francisco     |
|6362      |Rosie Morales       |Sales Representative           |2016-03-24      |San Francisco     |
|6363      |Maya Kennedy        |Sales Representative           |2016-04-23      |San Francisco     |
|6364      |Esme Warren         |Sales Representative           |2016-05-24      |San Francisco     |
|6365      |Grace Ellis         |Sales Representative           |2016-12-09      |San Francisco     |
|6366      |Lily Fisher         |Sales Representative           |2016-03-30      |San Francisco     |
|6367      |Sophia Reynolds     |Sales Representative           |2016-08-20      |San Francisco     |
|6368      |Sophie Owens        |Sales Representative           |2016-03-24      |San Francisco     |
|6369      |Poppy Jordan        |Sales Representative           |2016-01-30      |San Francisco     |
|6370      |Phoebe Murray       |Sales Representative           |2016-11-11      |San Francisco     |
|6371      |Holly Shaw          |Shipping Clerk                 |2016-01-27      |San Francisco     |
|6372      |Emilia Holmes       |Shipping Clerk                 |2016-02-20      |San Francisco     |
|6373      |Molly Rice          |Shipping Clerk                 |2016-06-24      |San Francisco     |
|6374      |Ellie Robertson     |Shipping Clerk                 |2016-02-07      |San Francisco     |
|6375      |Jasmine Hunt        |Shipping Clerk                 |2016-06-14      |San Francisco     |
|6376      |Eliza Black         |Shipping Clerk                 |2016-08-13      |San Francisco     |
|6377      |Lilly Daniels       |Shipping Clerk                 |2016-07-11      |San Francisco     |
|6378      |Abigail Palmer      |Shipping Clerk                 |2016-12-19      |San Francisco     |
|6379      |Georgia Mills       |Shipping Clerk                 |2016-02-04      |San Francisco     |
|6380      |Maisie Nichols      |Shipping Clerk                 |2016-03-03      |San Francisco     |
|6381      |Eleanor Grant       |Shipping Clerk                 |2016-07-01      |San Francisco     |
|6382      |Hannah Knight       |Shipping Clerk                 |2016-03-17      |San Francisco     |
|6383      |Harriet Ferguson    |Shipping Clerk                 |2016-04-24      |San Francisco     |
|6384      |Amber Rose          |Shipping Clerk                 |2016-05-23      |San Francisco     |
|6385      |Bella Stone         |Shipping Clerk                 |2016-06-21      |San Francisco     |
|6386      |Thea Hawkins        |Shipping Clerk                 |2016-01-13      |San Francisco     |
|6387      |Lola Ramos          |Shipping Clerk                 |2016-01-24      |San Francisco     |
|6388      |Willow Reyes        |Shipping Clerk                 |2016-02-23      |San Francisco     |
|6389      |Ivy Burns           |Shipping Clerk                 |2016-06-21      |San Francisco     |
|6390      |Erin Gordon         |Shipping Clerk                 |2016-02-03      |San Francisco     |
|6391      |Reggie Simmons      |Stock Clerk                    |2016-04-10      |San Francisco     |
|6392      |Emily Hamilton      |Stock Clerk                    |2016-03-15      |San Francisco     |
|6393      |Olivia Ford         |Stock Clerk                    |2016-01-29      |San Francisco     |
|6394      |Amelia Myers        |Stock Clerk                    |2016-10-17      |San Francisco     |
|6395      |Connor Hayes        |Stock Clerk                    |2016-04-06      |San Francisco     |
|6396      |Leon Powell         |Stock Clerk                    |2016-07-16      |San Francisco     |
|6397      |Kai Long            |Stock Clerk                    |2016-09-28      |New Jersy         |
|6398      |Aaron Patterson     |Stock Clerk                    |2016-01-14      |New Jersy         |
|6399      |Roman Hughes        |Stock Clerk                    |2016-03-08      |New Jersy         |
|6400      |Austin Flores       |Stock Clerk                    |2016-08-20      |New Jersy         |
|6401      |Ellis Washington    |Stock Clerk                    |2016-10-30      |New Jersy         |
|6402      |Jamie Butler        |Stock Clerk                    |2016-02-16      |New Jersy         |
|6403      |Isla Graham         |Stock Clerk                    |2016-07-09      |New Jersy         |
|6404      |Seth Foster         |Stock Clerk                    |2016-06-14      |New Jersy         |
|6405      |Carter Gonzales     |Stock Clerk                    |2016-08-26      |New Jersy         |
|6406      |Felix Bryant        |Stock Clerk                    |2016-12-12      |New Jersy         |
|6407      |Ibrahim Alexander   |Stock Clerk                    |2016-02-06      |New Jersy         |
|6408      |Sonny Russell       |Stock Clerk                    |2016-07-14      |New Jersy         |
|6409      |Kian Griffin        |Stock Clerk                    |2016-10-26      |New Jersy         |
|6410      |Caleb Diaz          |Stock Clerk                    |2016-02-12      |New Jersy         |
|6411      |Ronnie Perry        |Stock Manager                  |2016-11-16      |New Jersy         |
|6412      |Callum Jenkins      |Stock Manager                  |2016-10-10      |New Jersy         |
|6413      |Jackso Coleman      |Stock Manager                  |2016-05-01      |New Jersy         |
|6414      |Liam Henderson      |Stock Manager                  |2016-04-10      |New Jersy         |
|6415      |Jaxon Ross          |Stock Manager                  |2016-07-18      |New Jersy         |
|6432      |Beak Kimberly       |Programmer                     |2016-07-21      |New Jersy         |
|6452      |Candie Calvin       |Sales Representative           |2016-01-28      |Seattle Washington|
|6455      |Carr Claudia        |Sales Representative           |2016-06-30      |Seattle Washington|
|6458      |Champaigne Brian    |Sales Representative           |2016-09-06      |Seattle Washington|
|6467      |Clukey Elijian      |Sales Representative           |2016-07-06      |Seattle Washington|
|6474      |Crimmings   Jean    |Sales Representative           |2016-07-06      |Seattle Washington|
|6480      |Dee Randy           |Shipping Clerk                 |2018-07-09      |Seattle Washington|
|6486      |DeVito Tommy        |Shipping Clerk                 |2017-02-15      |Seattle Washington|
|6505      |Fernandes Nilson    |Stock Clerk                    |2015-05-11      |Toronto           |
|6533      |Gray Elijiah        |Accountant                     |2015-06-02      |Sydney            |
|6535      |Gruber Hans         |Human Resources Representative |2017-04-20      |Sydney            |
|6549      |Hunts Julissa       |Purchasing Manager             |2016-06-06      |Sydney            |
|6550      |Hutter Rosalie      |Sales Manager                  |2015-06-05      |Sydney            |
|6577      |Le Binh             |Sales Representative           |2016-10-02      |Mexico City       |
|6579      |LeBlanc Brandon     |Sales Representative           |2016-01-05      |Mexico City       |
|6592      |Manchester Robyn    |Shipping Clerk                 |2016-05-11      |Mexico City       |
|6599      |McKinzie Jac        |Shipping Clerk                 |2016-07-06      |Mexico City       |
|6612      |Navathe Kurt        |Stock Clerk                    |2017-02-10      |Mexico City       |
|6643      |Rachael Maggie      |Programmer                     |2016-10-02      |Beijing           |
|6655      |Roper Katie         |Purchasing Clerk               |2017-01-07      |Beijing           |
|6661      |SaarBeckles, Melinda|Sales Manager                  |2016-07-04      |Beijing           |
|6670      |Singh Nan           |Sales Representative           |2015-05-01      |Bombay            |
|6677      |Soze Keyser         |Sales Representative           |2016-06-30      |Bombay            |
|6690      |Tannen Biff         |Sales Representative           |2017-04-20      |Bombay            |

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2018a.png?raw=true)

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2018b.png?raw=true)

# Q19: Find Total Orders Fulfilled by Region
## Solution
```sql
SELECT 
    r.RegionID,
    r.RegionName,
    COUNT(o.OrderID) AS TotalOrders
FROM Region r
JOIN Warehouse w ON r.RegionID = w.RegionID
JOIN Employee e ON w.WarehouseID = e.WarehouseID
JOIN Orders o ON o.CustomerID IS NOT NULL  -- Simulate fulfillment (assuming all orders are handled)
GROUP BY r.RegionID, r.RegionName;
```
## Output
|regionid|regionname     |totalorders|
|--------|---------------|-----------|
|384     |Asia           |400        |
|351     |Asia           |400        |
|184     |North America  |400        |
|116     |North  America |400        |
|87      |North  America |400        |
|273     |North America  |400        |
|394     |Asia           |400        |
|51      |North  America |400        |
|272     |North America  |400        |
|70      |North  America |400        |
|190     |North America  |400        |
|350     |Asia           |400        |
|314     |Asia           |400        |
|386     |Asia           |400        |
|278     |North America  |400        |
|364     |Asia           |400        |
|299     |North America  |400        |
|176     |North  America |400        |
|169     |North  America |400        |
|345     |Asia           |400        |
|309     |North America  |400        |
|92      |North  America |400        |
|180     |North America  |400        |
|292     |North America  |400        |
|236     |Australia      |400        |
|271     |North America  |400        |
|263     |Australia      |400        |
|22      |South America  |400        |
|156     |North  America |400        |
|197     |North America  |400        |
|135     |North  America |400        |
|227     |Australia      |400        |
|282     |North America  |400        |
|390     |Asia           |400        |
|173     |North  America |400        |
|149     |North  America |400        |
|311     |North America  |400        |
|269     |North America  |400        |
|73      |North  America |400        |
|261     |Australia      |400        |
|103     |North  America |400        |
|280     |North America  |400        |
|42      |South America  |400        |
|189     |North America  |400        |
|239     |Australia      |400        |
|161     |North  America |400        |
|121     |North  America |400        |
|117     |North  America |400        |
|88      |North  America |400        |
|188     |North America  |400        |
|257     |Australia      |400        |
|125     |North  America |400        |
|113     |North  America |400        |
|40      |South America  |400        |
|240     |Australia      |400        |
|328     |Asia           |400        |
|43      |South America  |400        |
|196     |North America  |400        |
|120     |North  America |400        |
|291     |North America  |400        |
|15      |South America  |400        |
|226     |Australia      |400        |
|210     |North America  |400        |
|48      |North  America |400        |
|349     |Asia           |400        |
|187     |North America  |400        |
|298     |North America  |400        |
|57      |North  America |400        |
|81      |North  America |400        |
|61      |North  America |400        |
|19      |South America  |400        |
|244     |Australia      |400        |
|160     |North  America |400        |
|357     |Asia           |400        |
|242     |Australia      |400        |
|331     |Asia           |400        |
|251     |Australia      |400        |
|204     |North America  |400        |
|266     |Australia      |400        |
|104     |North  America |400        |
|5       |South America  |400        |
|171     |North  America |400        |
|315     |Asia           |400        |
|366     |Asia           |400        |
|307     |North America  |400        |
|397     |Asia           |400        |
|91      |North  America |400        |
|347     |Asia           |400        |
|283     |North America  |400        |
|305     |North America  |400        |
|179     |North America  |400        |
|54      |North  America |400        |
|29      |South America  |400        |
|4       |South America  |400        |
|297     |North America  |400        |
|181     |North America  |400        |
|361     |Asia           |400        |
|321     |Asia           |400        |
|96      |North  America |400        |
|303     |North America  |400        |
|201     |North America  |400        |
|10      |South America  |400        |
|105     |North  America |400        |
|35      |South America  |400        |
|107     |North  America |400        |
|6       |South America  |400        |
|233     |Australia      |400        |
|220     |North America  |400        |
|86      |North  America |400        |
|400     |Asia           |400        |
|93      |North  America |400        |
|89      |North  America |400        |
|373     |Asia           |400        |
|219     |North America  |400        |
|252     |Australia      |400        |
|241     |Australia      |400        |
|175     |North  America |400        |
|363     |Asia           |400        |
|343     |Asia           |400        |
|31      |South America  |400        |
|285     |North America  |400        |
|327     |Asia           |400        |
|50      |North  America |400        |
|253     |Australia      |400        |
|14      |South America  |400        |
|231     |Australia      |400        |
|66      |North  America |400        |
|340     |Asia           |400        |
|109     |North  America |400        |
|356     |Asia           |400        |
|155     |North  America |400        |
|13      |South America  |400        |
|391     |Asia           |400        |
|133     |North  America |400        |
|195     |North America  |400        |
|2       |South America  |400        |
|368     |Asia           |400        |
|199     |North America  |400        |
|372     |Asia           |400        |
|246     |Australia      |400        |
|75      |North  America |400        |
|369     |Asia           |400        |
|128     |North  America |400        |
|339     |Asia           |400        |
|243     |Australia      |400        |
|166     |North  America |400        |
|344     |Asia           |400        |
|142     |North  America |400        |
|335     |Asia           |400        |
|152     |North  America |400        |
|355     |Asia           |400        |
|383     |Asia           |400        |
|230     |Australia      |400        |
|301     |North America  |400        |
|7       |South America  |400        |
|222     |North America  |400        |
|381     |Asia           |400        |
|38      |South America  |400        |
|359     |Asia           |400        |
|193     |North America  |400        |
|254     |Australia      |400        |
|164     |North  America |400        |
|377     |Asia           |400        |
|78      |North  America |400        |
|217     |North America  |400        |
|159     |North  America |400        |
|250     |Australia      |400        |
|186     |North America  |400        |
|47      |North  America |400        |
|177     |North  America |400        |
|20      |South America  |400        |
|319     |Asia           |400        |
|182     |North America  |400        |
|1       |South America  |400        |
|76      |North  America |400        |
|106     |North  America |400        |
|18      |South America  |400        |
|110     |North  America |400        |
|178     |North  America |400        |
|145     |North  America |400        |
|129     |North  America |400        |
|27      |South America  |400        |
|143     |North  America |400        |
|203     |North America  |400        |
|58      |North  America |400        |
|228     |Australia      |400        |
|8       |South America  |400        |
|346     |Asia           |400        |
|294     |North America  |400        |
|370     |Asia           |400        |
|71      |North  America |400        |
|267     |Australia      |400        |
|229     |Australia      |400        |
|68      |North  America |400        |
|304     |North America  |400        |
|146     |North  America |400        |
|80      |North  America |400        |
|52      |North  America |400        |
|396     |Asia           |400        |
|382     |Asia           |400        |
|258     |Australia      |400        |
|162     |North  America |400        |
|378     |Asia           |400        |
|341     |Asia           |400        |
|132     |North  America |400        |
|322     |Asia           |400        |
|84      |North  America |400        |
|389     |Asia           |400        |
|170     |North  America |400        |
|192     |North America  |400        |
|330     |Asia           |400        |
|276     |North America  |400        |
|237     |Australia      |400        |
|101     |North  America |400        |
|69      |North  America |400        |
|262     |Australia      |400        |
|379     |Asia           |400        |
|323     |Asia           |400        |
|348     |Asia           |400        |
|337     |Asia           |400        |
|320     |Asia           |400        |
|375     |Asia           |400        |
|115     |North  America |400        |
|114     |North  America |400        |
|60      |North  America |400        |
|97      |North  America |400        |
|399     |Asia           |400        |
|238     |Australia      |400        |
|112     |North  America |400        |
|108     |North  America |400        |
|59      |North  America |400        |
|289     |North America  |400        |
|268     |North America  |400        |
|65      |North  America |400        |
|127     |North  America |400        |
|124     |North  America |400        |
|98      |North  America |400        |
|329     |Asia           |400        |
|200     |North America  |400        |
|44      |South America  |400        |
|11      |South America  |400        |
|235     |Australia      |400        |
|82      |North  America |400        |
|119     |North  America |400        |
|306     |North America  |400        |
|286     |North America  |400        |
|376     |Asia           |400        |
|153     |North  America |400        |
|279     |North America  |400        |
|147     |North  America |400        |
|214     |North America  |400        |
|338     |Asia           |400        |
|202     |North America  |400        |
|9       |South America  |400        |
|358     |Asia           |400        |
|79      |North  America |400        |
|26      |South America  |400        |
|85      |North  America |400        |
|72      |North  America |400        |
|281     |North America  |400        |
|95      |North  America |400        |
|259     |Australia      |400        |
|232     |Australia      |400        |
|77      |North  America |400        |
|302     |North America  |400        |
|172     |North  America |400        |
|30      |South America  |400        |
|288     |North America  |400        |
|21      |South America  |400        |
|131     |North  America |400        |
|3       |South America  |400        |
|324     |Asia           |400        |
|198     |North America  |400        |
|17      |South America  |400        |
|310     |North America  |400        |
|212     |North America  |400        |
|37      |South America  |400        |
|28      |South America  |400        |
|398     |Asia           |400        |
|353     |Asia           |400        |
|249     |Australia      |400        |
|255     |Australia      |400        |
|388     |Asia           |400        |
|165     |North  America |400        |
|56      |North  America |400        |
|151     |North  America |400        |
|296     |North America  |400        |
|209     |North America  |400        |
|74      |North  America |400        |
|225     |Australia      |400        |
|138     |North  America |400        |
|34      |South America  |400        |
|245     |Australia      |400        |
|205     |North America  |400        |
|83      |North  America |400        |
|67      |North  America |400        |
|333     |Asia           |400        |
|63      |North  America |400        |
|325     |Asia           |400        |
|90      |North  America |400        |
|395     |Asia           |400        |
|216     |North America  |400        |
|174     |North  America |400        |
|45      |North  America |400        |
|387     |Asia           |400        |
|295     |North America  |400        |
|213     |North America  |400        |
|134     |North  America |400        |
|334     |Asia           |400        |
|274     |North America  |400        |
|144     |North  America |400        |
|39      |South America  |400        |
|168     |North  America |400        |
|163     |North  America |400        |
|223     |Australia      |400        |
|352     |Asia           |400        |
|36      |South America  |400        |
|393     |Asia           |400        |
|287     |North America  |400        |
|362     |Asia           |400        |
|221     |North America  |400        |
|102     |North  America |400        |
|312     |North America  |400        |
|167     |North  America |400        |
|158     |North  America |400        |
|277     |North America  |400        |
|290     |North America  |400        |
|300     |North America  |400        |
|118     |North  America |400        |
|317     |Asia           |400        |
|284     |North America  |400        |
|265     |Australia      |400        |
|342     |Asia           |400        |
|111     |North  America |400        |
|16      |South America  |400        |
|207     |North America  |400        |
|62      |North  America |400        |
|123     |North  America |400        |
|126     |North  America |400        |
|194     |North America  |400        |
|326     |Asia           |400        |
|360     |Asia           |400        |
|385     |Asia           |400        |
|371     |Asia           |400        |
|99      |North  America |400        |
|367     |Asia           |400        |
|374     |Asia           |400        |
|41      |South America  |400        |
|206     |North America  |400        |
|46      |North  America |400        |
|365     |Asia           |400        |
|224     |Australia      |400        |
|157     |North  America |400        |
|53      |North  America |400        |
|32      |South America  |400        |
|336     |Asia           |400        |
|318     |Asia           |400        |
|275     |North America  |400        |
|247     |Australia      |400        |
|260     |Australia      |400        |
|308     |North America  |400        |
|183     |North America  |400        |
|100     |North  America |400        |
|313     |Asia           |400        |
|136     |North  America |400        |
|150     |North  America |400        |
|354     |Asia           |400        |
|140     |North  America |400        |
|139     |North  America |400        |
|12      |South America  |400        |
|248     |Australia      |400        |
|137     |North  America |400        |
|293     |North America  |400        |
|208     |North America  |400        |
|392     |Asia           |400        |
|24      |South America  |400        |
|191     |North America  |400        |
|25      |South America  |400        |
|141     |North  America |400        |
|122     |North  America |400        |
|94      |North  America |400        |
|218     |North America  |400        |
|154     |North  America |400        |
|234     |Australia      |400        |
|49      |North  America |400        |
|316     |Asia           |400        |
|211     |North America  |400        |
|256     |Australia      |400        |
|332     |Asia           |400        |
|33      |South America  |400        |
|264     |Australia      |400        |
|185     |North America  |400        |
|64      |North  America |400        |
|380     |Asia           |400        |
|215     |North America  |400        |
|55      |North  America |400        |
|148     |North  America |400        |
|130     |North  America |400        |
|270     |North America  |400        |
|23      |South America  |400        |

# Q20: Find Product Distribution by City
## Solution
```sql
SELECT 
    r.City,
    COUNT(DISTINCT od.ProductID) AS UniqueProductsDistributed
FROM Region r
JOIN Warehouse w ON r.RegionID = w.RegionID
JOIN Employee e ON w.WarehouseID = e.WarehouseID
JOIN Orders o ON o.CustomerID IS NOT NULL
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY r.City;
```
## Output
|city               |uniqueproductsdistributed|
|-------------------|-------------------------|
|Beijing            |400                      |
|Bombay             |400                      |
|Mexico City        |400                      |
|Seattle            |400                      |
|South Brunswick    |400                      |
|South San Francisco|400                      |
|Southlake          |400                      |
|Sydney             |400                      |
|Toronto            |400                      |

# Q21: Find Revenue Contribution by State and Country.
## Solution
```sql
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
```
## Output
|countryname              |state               |totalrevenue   |
|-------------------------|--------------------|---------------|
|Mexico                   |Distrito Federal    |1373404081.95  |
|United States of America |Washington          |1373404081.95  |
|United States of America |New Jersey          |1373404081.95  |
|Australia                |New South Wales     |1373404081.95  |
|China                    |Beijing             |1373404081.95  |
|United States of America |Texas               |1342883991.24  |
|Canada                   |Ontario             |1342883991.24  |
|United States of America |California          |1342883991.24  |
|India                    |Maharashtra         |1312363900.53  |

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2021a.png?raw=true)

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2021b.png?raw=true)

# Q22: Display Top Warehouses by Employee Count and Sales
## Solution
```sql
SELECT 
    w.WarehouseID,
    w.WarehouseName,
    COUNT(DISTINCT e.EmployeeID) AS TotalEmployees,
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalSales
FROM Warehouse w
JOIN Employee e ON w.WarehouseID = e.WarehouseID
JOIN Orders o ON o.CustomerID IS NOT NULL
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY w.WarehouseID, w.WarehouseName
ORDER BY TotalSales DESC
LIMIT 10;
```
## Output
|warehouseid|warehousename  |totalemployees|totalsales |
|-----------|---------------|--------------|-----------|
|102        |Southlake Texas|1             |30520090.71|
|103        |Southlake Texas|1             |30520090.71|
|104        |Southlake Texas|1             |30520090.71|
|105        |Southlake Texas|1             |30520090.71|
|106        |Southlake Texas|1             |30520090.71|
|107        |Southlake Texas|1             |30520090.71|
|108        |Southlake Texas|1             |30520090.71|
|109        |Southlake Texas|1             |30520090.71|
|110        |Southlake Texas|1             |30520090.71|
|101        |Southlake Texas|1             |30520090.71|

# Q23: Show Employee Roster by Region.
## Solution
```sql
SELECT 
    e.EmployeeID,
    e.EmployeeName,
    e.EmployeeJobTitle,
    w.WarehouseName,
    r.City,
    r.State,
    r.CountryName
FROM Employee e
JOIN Warehouse w ON e.WarehouseID = w.WarehouseID
JOIN Region r ON w.RegionID = r.RegionID;
```
## Output
|employeeid|employeename          |employeejobtitle               |warehousename     |city               |state           |countryname             |
|----------|----------------------|-------------------------------|------------------|-------------------|----------------|------------------------|
|6309      |Summer Payne          |Public Accountant              |Southlake Texas   |Southlake          |Texas           |United States of America|
|6310      |Rose Stephens         |Accounting Manager             |Southlake Texas   |Southlake          |Texas           |United States of America|
|6311      |Annabelle Dunn        |Administration Assistant       |Southlake Texas   |Southlake          |Texas           |United States of America|
|6312      |Tommy Bailey          |President                      |Southlake Texas   |Southlake          |Texas           |United States of America|
|6313      |Blake Cooper          |Administration Vice President  |Southlake Texas   |Southlake          |Texas           |United States of America|
|6314      |Jude Rivera           |Administration Vice President  |Southlake Texas   |Southlake          |Texas           |United States of America|
|6315      |Tyler Ramirez         |Accountant                     |Southlake Texas   |Southlake          |Texas           |United States of America|
|6316      |Ryan Gray             |Accountant                     |Southlake Texas   |Southlake          |Texas           |United States of America|
|6317      |Elliot Brooks         |Accountant                     |Southlake Texas   |Southlake          |Texas           |United States of America|
|6318      |Elliott James         |Accountant                     |Southlake Texas   |Southlake          |Texas           |United States of America|
|6319      |Albert Watson         |Accountant                     |Southlake Texas   |Southlake          |Texas           |United States of America|
|6320      |Mohammad Peterson     |Finance Manager                |Southlake Texas   |Southlake          |Texas           |United States of America|
|6321      |Harper Spencer        |Human Resources Representative |Southlake Texas   |Southlake          |Texas           |United States of America|
|6322      |Louie Richardson      |Programmer                     |Southlake Texas   |Southlake          |Texas           |United States of America|
|6323      |Nathan Cox            |Programmer                     |Southlake Texas   |Southlake          |Texas           |United States of America|
|6324      |Bobby Torres          |Programmer                     |Southlake Texas   |Southlake          |Texas           |United States of America|
|6325      |Charles Ward          |Programmer                     |Southlake Texas   |Southlake          |Texas           |United States of America|
|6326      |Gabriel Howard        |Programmer                     |Southlake Texas   |Southlake          |Texas           |United States of America|
|6327      |Emma Perkins          |Marketing Manager              |Southlake Texas   |Southlake          |Texas           |United States of America|
|6328      |Amelie Hudson         |Marketing Representative       |Southlake Texas   |Southlake          |Texas           |United States of America|
|6329      |Gracie Gardner        |Public Relations Representative|Southlake Texas   |Southlake          |Texas           |United States of America|
|6330      |Frederick Price       |Purchasing Clerk               |Southlake Texas   |Southlake          |Texas           |United States of America|
|6331      |Alex Sanders          |Purchasing Clerk               |Southlake Texas   |Southlake          |Texas           |United States of America|
|6332      |Ollie Bennett         |Purchasing Clerk               |Southlake Texas   |Southlake          |Texas           |United States of America|
|6333      |Louis Wood            |Purchasing Clerk               |Southlake Texas   |Southlake          |Texas           |United States of America|
|6334      |Dexter Barnes         |Purchasing Clerk               |Southlake Texas   |Southlake          |Texas           |United States of America|
|6335      |Rory Kelly            |Purchasing Manager             |Southlake Texas   |Southlake          |Texas           |United States of America|
|6336      |Isabella Cole         |Sales Manager                  |Southlake Texas   |Southlake          |Texas           |United States of America|
|6337      |Jessica Woods         |Sales Manager                  |Southlake Texas   |Southlake          |Texas           |United States of America|
|6338      |Ella Wallace          |Sales Manager                  |Southlake Texas   |Southlake          |Texas           |United States of America|
|6339      |Ava Sullivan          |Sales Manager                  |Southlake Texas   |Southlake          |Texas           |United States of America|
|6340      |Mia West              |Sales Manager                  |Southlake Texas   |Southlake          |Texas           |United States of America|
|6341      |Evie Harrison         |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6342      |Scarlett Gibson       |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6343      |Ruby Mcdonald         |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6344      |Chloe Cruz            |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6345      |Isabelle Marshall     |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6346      |Daisy Ortiz           |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6347      |Freya Gomez           |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6348      |Elizabeth Dixon       |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6349      |Florence Freeman      |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6350      |Alice Wells           |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6351      |Charlotte Webb        |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6352      |Sienna Simpson        |Sales Representative           |Southlake Texas   |Southlake          |Texas           |United States of America|
|6353      |Matilda Stevens       |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6354      |Evelyn Tucker         |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6355      |Eva Porter            |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6356      |Millie Hunter         |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6357      |Sofia Hicks           |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6358      |Lucy Crawford         |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6359      |Elsie Henry           |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6360      |Imogen Boyd           |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6361      |Layla Mason           |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6362      |Rosie Morales         |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6363      |Maya Kennedy          |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6364      |Esme Warren           |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6365      |Grace Ellis           |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6366      |Lily Fisher           |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6367      |Sophia Reynolds       |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6368      |Sophie Owens          |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6369      |Poppy Jordan          |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6370      |Phoebe Murray         |Sales Representative           |San Francisco     |South San Francisco|California      |United States of America|
|6371      |Holly Shaw            |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6372      |Emilia Holmes         |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6373      |Molly Rice            |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6374      |Ellie Robertson       |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6375      |Jasmine Hunt          |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6376      |Eliza Black           |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6377      |Lilly Daniels         |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6378      |Abigail Palmer        |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6379      |Georgia Mills         |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6380      |Maisie Nichols        |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6381      |Eleanor Grant         |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6382      |Hannah Knight         |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6383      |Harriet Ferguson      |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6384      |Amber Rose            |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6385      |Bella Stone           |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6386      |Thea Hawkins          |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6387      |Lola Ramos            |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6388      |Willow Reyes          |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6389      |Ivy Burns             |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6390      |Erin Gordon           |Shipping Clerk                 |San Francisco     |South San Francisco|California      |United States of America|
|6391      |Reggie Simmons        |Stock Clerk                    |San Francisco     |South San Francisco|California      |United States of America|
|6392      |Emily Hamilton        |Stock Clerk                    |San Francisco     |South San Francisco|California      |United States of America|
|6393      |Olivia Ford           |Stock Clerk                    |San Francisco     |South San Francisco|California      |United States of America|
|6394      |Amelia Myers          |Stock Clerk                    |San Francisco     |South San Francisco|California      |United States of America|
|6395      |Connor Hayes          |Stock Clerk                    |San Francisco     |South San Francisco|California      |United States of America|
|6396      |Leon Powell           |Stock Clerk                    |San Francisco     |South San Francisco|California      |United States of America|
|6397      |Kai Long              |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6398      |Aaron Patterson       |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6399      |Roman Hughes          |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6400      |Austin Flores         |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6401      |Ellis Washington      |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6402      |Jamie Butler          |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6403      |Isla Graham           |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6404      |Seth Foster           |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6405      |Carter Gonzales       |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6406      |Felix Bryant          |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6407      |Ibrahim Alexander     |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6408      |Sonny Russell         |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6409      |Kian Griffin          |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6410      |Caleb Diaz            |Stock Clerk                    |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6411      |Ronnie Perry          |Stock Manager                  |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6412      |Callum Jenkins        |Stock Manager                  |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6413      |Jackso Coleman        |Stock Manager                  |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6414      |Liam Henderson        |Stock Manager                  |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6415      |Jaxon Ross            |Stock Manager                  |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6416      |Adinolfi Wilson       |Public Accountant              |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6417      |AitSidi Karthikeyan   |Accounting Manager             |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6418      |Akinkuolie Sarah      |Administration Assistant       |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6419      |AlagbeTrina           |President                      |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6420      |Anderson Carol        |Administration Vice President  |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6421      |Anderson Linda        |Administration Vice President  |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6422      |Andreola Colby        |Accountant                     |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6423      |Athwal Sam            |Accountant                     |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6424      |Bachiochi Linda       |Accountant                     |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6425      |Bacong Alejandro      |Accountant                     |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6426      |Baczenski Rachael     |Accountant                     |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6427      |Barbara Thomas        |Finance Manager                |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6428      |Barbossa Hector       |Human Resources Representative |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6429      |Barone Francesco      |Programmer                     |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6430      |Barton Nader          |Programmer                     |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6431      |Bates Norman          |Programmer                     |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6432      |Beak Kimberly         |Programmer                     |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6433      |Beatrice Courtney     |Programmer                     |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6434      |Becker Renee          |Marketing Manager              |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6435      |Becker Scott          |Marketing Representative       |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6436      |Bernstein Sean        |Public Relations Representative|New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6437      |Biden Lowan           |Purchasing Clerk               |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6438      |Billis Helen          |Purchasing Clerk               |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6439      |Blount Dianna         |Purchasing Clerk               |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6440      |Bondwell Betsy        |Purchasing Clerk               |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6441      |Booth Frank           |Purchasing Clerk               |New Jersy         |South Brunswick    |New Jersey      |United States of America|
|6442      |Boutwell Bonalyn      |Purchasing Manager             |Seattle Washington|Seattle            |Washington      |United States of America|
|6443      |Bozzi Charles         |Sales Manager                  |Seattle Washington|Seattle            |Washington      |United States of America|
|6444      |Brill Donna           |Sales Manager                  |Seattle Washington|Seattle            |Washington      |United States of America|
|6445      |Brown Mia             |Sales Manager                  |Seattle Washington|Seattle            |Washington      |United States of America|
|6446      |Buccheri Joseph       |Sales Manager                  |Seattle Washington|Seattle            |Washington      |United States of America|
|6447      |Bugali Josephine      |Sales Manager                  |Seattle Washington|Seattle            |Washington      |United States of America|
|6448      |Bunbury Jessica       |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6449      |Burke Joelle          |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6450      |Burkett Benjamin      |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6451      |Cady Max              |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6452      |Candie Calvin         |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6453      |Carabbio Judith       |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6454      |Carey Michael         |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6455      |Carr Claudia          |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6456      |Carter Michelle       |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6457      |Chace Beatrice        |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6458      |Champaigne Brian      |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6459      |Chan Lin              |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6460      |Chang Donovan         |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6461      |Chigurh Anton         |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6462      |Chivukula Enola       |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6463      |Cierpiszewski Caroline|Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6464      |Clayton Rick          |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6465      |Cloninger Jennifer    |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6466      |Close Phil            |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6467      |Clukey Elijian        |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6468      |Cockel James          |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6469      |Cole Spencer          |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6470      |Corleone Michael      |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6471      |Corleone Vito         |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6472      |Cornett Lisa          |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6473      |Costello Frank        |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6474      |Crimmings   Jean      |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6475      |Cross Noah            |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6476      |Daneault Lynn         |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6477      |Daniele Ann           |Sales Representative           |Seattle Washington|Seattle            |Washington      |United States of America|
|6478      |Darson Jene'ya        |Shipping Clerk                 |Seattle Washington|Seattle            |Washington      |United States of America|
|6479      |Davis Daniel          |Shipping Clerk                 |Seattle Washington|Seattle            |Washington      |United States of America|
|6480      |Dee Randy             |Shipping Clerk                 |Seattle Washington|Seattle            |Washington      |United States of America|
|6481      |DeGweck  James        |Shipping Clerk                 |Seattle Washington|Seattle            |Washington      |United States of America|
|6482      |DelBosque, Keyla      |Shipping Clerk                 |Seattle Washington|Seattle            |Washington      |United States of America|
|6483      |Delarge Alex          |Shipping Clerk                 |Seattle Washington|Seattle            |Washington      |United States of America|
|6484      |Demita Carla          |Shipping Clerk                 |Seattle Washington|Seattle            |Washington      |United States of America|
|6485      |Desimone Carl         |Shipping Clerk                 |Seattle Washington|Seattle            |Washington      |United States of America|
|6486      |DeVito Tommy          |Shipping Clerk                 |Seattle Washington|Seattle            |Washington      |United States of America|
|6487      |Dietrich Jenna        |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6488      |DiNocco Lily          |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6489      |Dobrin Denisa         |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6490      |Dolan Linda           |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6491      |Dougall Eric          |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6492      |Driver Elle           |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6493      |Dunn Amy              |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6494      |Dunne Amy             |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6495      |Eaton Marianne        |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6496      |Engdahl Jean          |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6497      |England Rex           |Shipping Clerk                 |Toronto           |Toronto            |Ontario         |Canada                  |
|6498      |Erilus Angela         |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6499      |Estremera Miguel      |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6500      |Evensen April         |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6501      |Exantus Susan         |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6502      |Faller Megan          |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6503      |Fancett Nicole        |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6504      |Ferguson Susan        |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6505      |Fernandes Nilson      |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6506      |Fett Boba             |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6507      |Fidelia  Libby        |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6508      |Fitzpatrick Michael   |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6509      |Foreman Tanya         |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6510      |Forrest Alex          |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6511      |Foss Jason            |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6512      |FosterBaker Amy       |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6513      |Fraval Maruk          |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6514      |Galia Lisa            |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6515      |Garcia Raul           |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6516      |Gaul Barbara          |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6517      |Gentry Mildred        |Stock Clerk                    |Toronto           |Toronto            |Ontario         |Canada                  |
|6518      |Gerke Melisa          |Stock Manager                  |Toronto           |Toronto            |Ontario         |Canada                  |
|6519      |Gill Whitney          |Stock Manager                  |Toronto           |Toronto            |Ontario         |Canada                  |
|6520      |Gilles Alex           |Stock Manager                  |Toronto           |Toronto            |Ontario         |Canada                  |
|6521      |Girifalco Evelyn      |Stock Manager                  |Toronto           |Toronto            |Ontario         |Canada                  |
|6522      |Givens Myriam         |Stock Manager                  |Toronto           |Toronto            |Ontario         |Canada                  |
|6523      |Goble Taisha          |Public Accountant              |Toronto           |Toronto            |Ontario         |Canada                  |
|6524      |Goeth Amon            |Accounting Manager             |Toronto           |Toronto            |Ontario         |Canada                  |
|6525      |Gold Shenice          |Administration Assistant       |Toronto           |Toronto            |Ontario         |Canada                  |
|6526      |Gonzalez Cayo         |President                      |Toronto           |Toronto            |Ontario         |Canada                  |
|6527      |Gonzalez Juan         |Administration Vice President  |Toronto           |Toronto            |Ontario         |Canada                  |
|6528      |Gonzalez Maria        |Administration Vice President  |Toronto           |Toronto            |Ontario         |Canada                  |
|6529      |Good Susan            |Accountant                     |Toronto           |Toronto            |Ontario         |Canada                  |
|6530      |Gordon David          |Accountant                     |Toronto           |Toronto            |Ontario         |Canada                  |
|6531      |Gosciminski Phylicia  |Accountant                     |Sydney            |Sydney             |New South Wales |Australia               |
|6532      |Goyal Roxana          |Accountant                     |Sydney            |Sydney             |New South Wales |Australia               |
|6533      |Gray Elijiah          |Accountant                     |Sydney            |Sydney             |New South Wales |Australia               |
|6534      |Gross Paula           |Finance Manager                |Sydney            |Sydney             |New South Wales |Australia               |
|6535      |Gruber Hans           |Human Resources Representative |Sydney            |Sydney             |New South Wales |Australia               |
|6536      |Guilianno Mike        |Programmer                     |Sydney            |Sydney             |New South Wales |Australia               |
|6537      |Handschiegl Joanne    |Programmer                     |Sydney            |Sydney             |New South Wales |Australia               |
|6538      |Hankard Earnest       |Programmer                     |Sydney            |Sydney             |New South Wales |Australia               |
|6539      |Harrington Christie   |Programmer                     |Sydney            |Sydney             |New South Wales |Australia               |
|6540      |Harrison Kara         |Programmer                     |Sydney            |Sydney             |New South Wales |Australia               |
|6541      |Heitzman Anthony      |Marketing Manager              |Sydney            |Sydney             |New South Wales |Australia               |
|6542      |Hendrickson Trina     |Marketing Representative       |Sydney            |Sydney             |New South Wales |Australia               |
|6543      |Hitchcock Alfred      |Public Relations Representative|Sydney            |Sydney             |New South Wales |Australia               |
|6544      |Homberger Adrienne    |Purchasing Clerk               |Sydney            |Sydney             |New South Wales |Australia               |
|6545      |Horton Jayne          |Purchasing Clerk               |Sydney            |Sydney             |New South Wales |Australia               |
|6546      |Houlihan Debra        |Purchasing Clerk               |Sydney            |Sydney             |New South Wales |Australia               |
|6547      |Howard Estelle        |Purchasing Clerk               |Sydney            |Sydney             |New South Wales |Australia               |
|6548      |Hudson Jane           |Purchasing Clerk               |Sydney            |Sydney             |New South Wales |Australia               |
|6549      |Hunts Julissa         |Purchasing Manager             |Sydney            |Sydney             |New South Wales |Australia               |
|6550      |Hutter Rosalie        |Sales Manager                  |Sydney            |Sydney             |New South Wales |Australia               |
|6551      |Huynh Ming            |Sales Manager                  |Sydney            |Sydney             |New South Wales |Australia               |
|6552      |Immediato Walter      |Sales Manager                  |Sydney            |Sydney             |New South Wales |Australia               |
|6553      |Ivey Rose             |Sales Manager                  |Sydney            |Sydney             |New South Wales |Australia               |
|6554      |Jackson Maryellen     |Sales Manager                  |Sydney            |Sydney             |New South Wales |Australia               |
|6555      |Jacobi Hannah         |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6556      |Jeannite Tayana       |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6557      |Jhaveri Sneha         |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6558      |Johnson George        |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6559      |Johnson Noelle        |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6560      |Johnston Yen          |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6561      |Jung Judy             |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6562      |Kampew Donysha        |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6563      |Keatts Kramer         |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6564      |Khemmich Bartholemew  |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6565      |King Janet            |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6566      |Kinsella Kathleen     |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6567      |Kirill Alexandra      |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6568      |Knapp Bradley         |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6569      |Kretschmer John       |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6570      |Kreuger Freddy        |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6571      |Lajiri Jyoti          |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6572      |Landa Hans            |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6573      |Langford Lindsey      |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6574      |Langton Enrico        |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6575      |LaRotonda William     |Sales Representative           |Sydney            |Sydney             |New South Wales |Australia               |
|6576      |Latif Mohammed        |Sales Representative           |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6577      |Le Binh               |Sales Representative           |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6578      |Leach Dallas          |Sales Representative           |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6579      |LeBlanc Brandon       |Sales Representative           |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6580      |Lecter Hannibal       |Sales Representative           |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6581      |Leruth Giovanni       |Sales Representative           |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6582      |Liebig Ketsia         |Sales Representative           |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6583      |Linares Marilyn       |Sales Representative           |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6584      |Linden Mathew         |Sales Representative           |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6585      |Lindsay Leonara       |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6586      |Lundy Susan           |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6587      |Lunquist Lisa         |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6588      |Lydon Allison         |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6589      |Lynch Lindsay         |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6590      |MacLennan Samuel      |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6591      |Mahoney Lauren        |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6592      |Manchester Robyn      |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6593      |Mancuso Karen         |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6594      |Mangal Debbie         |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6595      |Martin Sandra         |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6596      |Maurice Shana         |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6597      |Carthy B'rigit        |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6598      |Mckenna Sandy         |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6599      |McKinzie Jac          |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6600      |Meads Elizabeth       |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6601      |Medeiros Jennifer     |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6602      |Miller Brannon        |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6603      |Miller Ned            |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6604      |Monkfish Erasumus     |Shipping Clerk                 |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6605      |Monroe Peter          |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6606      |Monterro Luisa        |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6607      |Moran Patrick         |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6608      |Morway Tanya          |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6609      |Motlagh  Dawn         |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6610      |Moumanil Maliki       |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6611      |Myers Michael         |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6612      |Navathe Kurt          |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6613      |Ndzi Colombui         |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6614      |Ndzi Horia            |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6615      |Newman Richard        |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6616      |Ngodup Shari          |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6617      |Nguyen Dheepa         |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6618      |Nguyen Lei-Ming       |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6619      |Nowlan Kristie        |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6620      |Ohare Lynn            |Stock Clerk                    |Mexico City       |Mexico City        |Distrito Federal|Mexico                  |
|6621      |Oliver Brooke         |Stock Clerk                    |Beijing           |Beijing            |Beijing         |China                   |
|6622      |Onque Jasmine         |Stock Clerk                    |Beijing           |Beijing            |Beijing         |China                   |
|6623      |Osturnka Adeel        |Stock Clerk                    |Beijing           |Beijing            |Beijing         |China                   |
|6624      |Owad Clinton          |Stock Clerk                    |Beijing           |Beijing            |Beijing         |China                   |
|6625      |Ozark Travis          |Stock Manager                  |Beijing           |Beijing            |Beijing         |China                   |
|6626      |Panjwani Nina         |Stock Manager                  |Beijing           |Beijing            |Beijing         |China                   |
|6627      |Patronick Lucas       |Stock Manager                  |Beijing           |Beijing            |Beijing         |China                   |
|6628      |Pearson Randall       |Stock Manager                  |Beijing           |Beijing            |Beijing         |China                   |
|6629      |Smith Martin          |Stock Manager                  |Beijing           |Beijing            |Beijing         |China                   |
|6630      |Pelletier Ermine      |Public Accountant              |Beijing           |Beijing            |Beijing         |China                   |
|6631      |Perry Shakira         |Accounting Manager             |Beijing           |Beijing            |Beijing         |China                   |
|6632      |Peters Lauren         |Administration Assistant       |Beijing           |Beijing            |Beijing         |China                   |
|6633      |Peterson Ebonee       |President                      |Beijing           |Beijing            |Beijing         |China                   |
|6634      |Petingill Shana       |Administration Vice President  |Beijing           |Beijing            |Beijing         |China                   |
|6635      |Petrowsky Thelma      |Administration Vice President  |Beijing           |Beijing            |Beijing         |China                   |
|6636      |Pham Hong             |Accountant                     |Beijing           |Beijing            |Beijing         |China                   |
|6637      |Pitt Brad             |Accountant                     |Beijing           |Beijing            |Beijing         |China                   |
|6638      |Potts Xana            |Accountant                     |Beijing           |Beijing            |Beijing         |China                   |
|6639      |Power Morissa         |Accountant                     |Beijing           |Beijing            |Beijing         |China                   |
|6640      |Punjabhi Louis        |Accountant                     |Beijing           |Beijing            |Beijing         |China                   |
|6641      |Purinton Janine       |Finance Manager                |Beijing           |Beijing            |Beijing         |China                   |
|6642      |Quinn Sean            |Human Resources Representative |Beijing           |Beijing            |Beijing         |China                   |
|6643      |Rachael Maggie        |Programmer                     |Beijing           |Beijing            |Beijing         |China                   |
|6644      |Rarrick Quinn         |Programmer                     |Beijing           |Beijing            |Beijing         |China                   |
|6645      |Ren Kylo              |Programmer                     |Beijing           |Beijing            |Beijing         |China                   |
|6646      |Rhoads Thomas         |Programmer                     |Beijing           |Beijing            |Beijing         |China                   |
|6647      |Rivera Haley          |Programmer                     |Beijing           |Beijing            |Beijing         |China                   |
|6648      |Roberson May          |Marketing Manager              |Beijing           |Beijing            |Beijing         |China                   |
|6649      |Robertson Peter       |Marketing Representative       |Beijing           |Beijing            |Beijing         |China                   |
|6650      |Robinson Alain        |Public Relations Representative|Beijing           |Beijing            |Beijing         |China                   |
|6651      |Robinson Cherly       |Purchasing Clerk               |Beijing           |Beijing            |Beijing         |China                   |
|6652      |Robinson Elias        |Purchasing Clerk               |Beijing           |Beijing            |Beijing         |China                   |
|6653      |Roby Lori             |Purchasing Clerk               |Beijing           |Beijing            |Beijing         |China                   |
|6654      |Roehrich Bianca       |Purchasing Clerk               |Beijing           |Beijing            |Beijing         |China                   |
|6655      |Roper Katie           |Purchasing Clerk               |Beijing           |Beijing            |Beijing         |China                   |
|6656      |Rose Ashley           |Purchasing Manager             |Beijing           |Beijing            |Beijing         |China                   |
|6657      |Rossetti Bruno        |Sales Manager                  |Beijing           |Beijing            |Beijing         |China                   |
|6658      |RoupSimon             |Sales Manager                  |Beijing           |Beijing            |Beijing         |China                   |
|6659      |Ruiz Ricardo          |Sales Manager                  |Beijing           |Beijing            |Beijing         |China                   |
|6660      |Saada Adell           |Sales Manager                  |Beijing           |Beijing            |Beijing         |China                   |
|6661      |SaarBeckles, Melinda  |Sales Manager                  |Beijing           |Beijing            |Beijing         |China                   |
|6662      |Sadki Nore            |Sales Representative           |Beijing           |Beijing            |Beijing         |China                   |
|6663      |Sahoo Adil            |Sales Representative           |Beijing           |Beijing            |Beijing         |China                   |
|6664      |Salter Jason          |Sales Representative           |Beijing           |Beijing            |Beijing         |China                   |
|6665      |Sander Kamrin         |Sales Representative           |Beijing           |Beijing            |Beijing         |China                   |
|6666      |Sewkumar Nori         |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6667      |Shepard Anita         |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6668      |Shields Seffi         |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6669      |Simard Kramer         |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6670      |Singh Nan             |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6671      |Sloan Constance       |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6672      |Smith Joe             |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6673      |Smith John            |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6674      |Smith Leigh Ann       |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6675      |Smith Sade            |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6676      |Soto Julia            |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6677      |Soze Keyser           |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6678      |Sparks Taylor         |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6679      |Spirea Kelley         |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6680      |Squatrito Kristen     |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6681      |StanfordBarbara       |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6682      |Stansfield Norman     |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6683      |Steans Tyrone         |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6684      |Stoica Rick           |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6685      |Strong Caitrin        |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6686      |Sullivan Kissy        |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6687      |Sullivan Timothy      |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6688      |Sutwell Barbara       |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6689      |Szabo Andrew          |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6690      |Tannen Biff           |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6691      |Tavares Desiree       |Sales Representative           |Bombay            |Bombay             |Maharashtra     |India                   |
|6692      |Tejeda Lenora         |Shipping Clerk                 |Bombay            |Bombay             |Maharashtra     |India                   |
|6693      |Terry Sharlene        |Shipping Clerk                 |Bombay            |Bombay             |Maharashtra     |India                   |
|6694      |Theamstern Sophia     |Shipping Clerk                 |Bombay            |Bombay             |Maharashtra     |India                   |
|6695      |Thibaud Kenneth       |Shipping Clerk                 |Bombay            |Bombay             |Maharashtra     |India                   |
|6696      |Tippett Jeanette      |Shipping Clerk                 |Bombay            |Bombay             |Maharashtra     |India                   |
|6697      |Torrence Jack         |Shipping Clerk                 |Bombay            |Bombay             |Maharashtra     |India                   |
|6698      |Trang Mei             |Shipping Clerk                 |Bombay            |Bombay             |Maharashtra     |India                   |
|6699      |Tredinnick Neville    |Stock Clerk                    |Bombay            |Bombay             |Maharashtra     |India                   |
|6700      |True Edward           |Stock Clerk                    |Bombay            |Bombay             |Maharashtra     |India                   |
|6701      |Trzeciak Cybil        |Stock Clerk                    |Bombay            |Bombay             |Maharashtra     |India                   |
|6702      |Turpin Jumil          |Stock Clerk                    |Bombay            |Bombay             |Maharashtra     |India                   |
|6703      |ValentinJackie        |Stock Clerk                    |Bombay            |Bombay             |Maharashtra     |India                   |
|6704      |Veera Abdellah        |Stock Clerk                    |Bombay            |Bombay             |Maharashtra     |India                   |
|6705      |Vega Vincent          |Stock Manager                  |Bombay            |Bombay             |Maharashtra     |India                   |
|6706      |Villanueva Noah       |Stock Manager                  |Bombay            |Bombay             |Maharashtra     |India                   |
|6707      |Zima Colleen          |Stock Manager                  |Bombay            |Bombay             |Maharashtra     |India                   |
|6708      |Volk Colleen          |Stock Manager                  |Bombay            |Bombay             |Maharashtra     |India                   |

# Q24: Display Warehouse Coverage by Country.
## Solution
```sql
SELECT 
    r.CountryName,
    COUNT(DISTINCT w.WarehouseID) AS NumberOfWarehouses
FROM Region r
JOIN Warehouse w ON r.RegionID = w.RegionID
GROUP BY r.CountryName;
```
## Output
|countryname             |numberofwarehouses|
|------------------------|------------------|
|Australia               |45                |
|Canada                  |44                |
|China                   |45                |
|India                   |43                |
|Mexico                  |45                |
|United States of America|178               |

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2024b.png?raw=true)

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2024a.png?raw=true)
