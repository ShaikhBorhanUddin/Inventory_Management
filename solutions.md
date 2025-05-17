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

# Q5: What is the average order value (AOV) for top 15 customers?

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

# Q6: Which product has the highest profit margin, and what is the margin percentage?

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

# Q7: Which day of the week has the highest total sales revenue?

Understanding which day of the week generates the highest total sales revenue is crucial for businesses to optimize operations, marketing, and resource allocation. By identifying peak sales days, companies can better manage inventory, schedule staff, and plan targeted promotions to maximize revenue. This analysis helps in recognizing customer purchasing patterns and behavioral trends, enabling data-driven decisions to enhance profitability and improve overall business efficiency.

## Solution
```SQL
SELECT 
    TO_CHAR(OrderDate, 'Day') AS DayOfWeek, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY DayOfWeek
ORDER BY TotalRevenue DESC;
```
This query calculates the total sales revenue for each day of the week by aggregating the revenue generated from all orders. It first converts the `OrderDate` into the day of the week name using the `TO_CHAR` function, labeling it as `DayOfWeek`. Then, it joins the `Orders` table with `OrderDetails` to access the quantity and price of each order item. For each day, it sums the product of `OrderItemQuantity` and `PerUnitPrice` to compute the total revenue. The results are grouped by day of the week and ordered in descending order of total revenue, helping identify which day generates the highest sales.

## Output
|dayofweek|totalrevenue|
|---------|------------|
|Tuesday  |7816402.08  |
|Wednesday|5156222.01  |
|Friday   |4916067.86  |
|Thursday |4250796.84  |
|Monday   |3351974.22  |
|Sunday   |2619526.99  |
|Saturday |2409100.71  |

The data shows that **Tuesday** generates the highest total revenue, reaching approximately **$7.82 million**, followed by **Wednesday** with about **$5.16 million** and **Friday** with around **$4.92 million**. The midweek days (Tuesday to Friday) generally see stronger sales compared to the weekend, where **Sunday** and **Saturday** report the lowest revenues of approximately **$2.62 million** and **$2.41 million** respectively. This pattern suggests that customer purchasing activity peaks during weekdays, especially early to midweek, which could inform staffing and promotional strategies.

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%209a.png?raw=true)

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%209b.png?raw=true)

# Q8: Which employees has been working the longest (oldest hire date)?

The question holds significant value in the context of business intelligence (BI) as it highlights employee tenure and organizational loyalty. Identifying long-serving employees helps companies recognize and reward experience, dedication, and institutional knowledge—qualities that can positively influence productivity, team morale, and customer satisfaction. From an HR and operational perspective, such insights support strategic decisions around succession planning, mentoring programs, and retaining critical human capital that contributes to the organization's stability and continuity.

## Solution
```SQL
SELECT 
    EmployeeID, 
    EmployeeName, 
    EmployeeHireDate
FROM Employee
ORDER BY EmployeeHireDate ASC
LIMIT 10;
```
This SQL query retrieves the top 10 employees who have been with the company the longest by selecting their `EmployeeID`, `EmployeeName`, and `EmployeeHireDate` from the `Employee` table. The `ORDER BY EmployeeHireDate ASC` clause sorts the employees in ascending order based on their hire date, meaning those hired earliest appear first. The `LIMIT 10` clause restricts the result to only the first 10 records, effectively listing the ten employees with the oldest hire dates—those who have the longest tenure within the organization.

## Output
|employeeid|employeename    |employeehiredate|
|----------|----------------|----------------|
|6708      |Volk Colleen    |2000-05-15      |
|6697      |Torrence Jack   |2006-01-09      |
|6695      |Thibaud Kenneth |2007-06-25      |
|6637      |Pitt Brad       |2007-11-05      |
|6419      |AlagbeTrina     |2008-01-07      |
|6706      |Villanueva Noah |2008-09-11      |
|6445      |Brown Mia       |2008-10-27      |
|6471      |Corleone Vito   |2009-01-05      |
|6662      |Sadki Nore      |2009-01-05      |
|6512      |FosterBaker Amy |2009-01-05      |

The query result shows the ten employees with the longest tenure in the organization, based on their hire dates. At the top of the list is **Volk Colleen**, who has been with the company **since May 15, 2000**, making her the most senior employee. The rest of the employees on the list were hired **between 2006 and 2009**, indicating a core group of long-serving staff who have likely contributed significantly to organizational continuity and experience retention. This information can be useful for identifying experienced employees who may serve as mentors or be considered for leadership roles.

## Visualization

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Shhet%2011.png?raw=true)

# Q9: Which product has the highest total quantity sold and how much profit is generated?

This question is crucial in Business Intelligence as it identifies the best-selling product by volume and evaluates the profit it brings to the business. While high sales volume often signals product popularity or market demand, it doesn't always equate to profitability. By also calculating the total profit, decision-makers can determine whether the product's success in quantity sold aligns with its contribution to financial performance. This insight helps optimize product strategies, such as inventory stocking, marketing focus, and pricing models, ensuring that top-selling items are also financially viable.

## Solution
```SQL
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
```
This SQL query retrieves the top 10 products based on the total quantity sold, along with the total profit generated from those sales. It joins the `OrderDetails` table with the `Product` table using the `ProductID` to match each order item to its product details. The `SUM(od.OrderItemQuantity)` calculates the total number of units sold for each product, while `SUM(od.OrderItemQuantity * p.Profit)` computes the total profit by multiplying the number of units sold with the per-unit profit of each product. The results are grouped by product ID and name to aggregate values per product, then sorted in descending order of quantity sold, and finally, only the top 10 records are displayed. This helps in identifying the most sold and most profitable products.

## Output
|productid|productname                                     |totalquantitysold|totalprofit|
|---------|------------------------------------------------|-----------------|-----------|
|P399     |Zotac ZT-P10810A-10P                            |157              |23179.48   |
|P316     |Zion ZHY16004096 4 GB Ddr3                      |150              |22500.00   |
|P060     |Intel Xeon E5-2630 V4                           |150              |17856.00   |
|P307     |G.Skill RipjawsX (F3-1600C9Q-32GXM) DDR3 32 GB  |149              |412730.00  |
|P306     |G.Skill TridentX (F3-2400C10D-8GTX) DDR3 8GB    |149              |292338.00  |
|P017     |Intel Xeon E5-2470V2                            |149              |34679.75   |
|P263     |Hitachi A7K1000-1000                            |148              |0.00       |
|P006     |Intel Xeon E5-2695 V3 (OEM/Tray)                |148              |75009.36   |
|P023     |Intel Xeon E5-1680 V3 (OEM/Tray)                |148              |34356.72   |
|P391     |AMD FirePro S7000                               |147              |41465.76   |

The analysis reveals the top 10 products based on total quantity sold, along with the profit each generated. The **Zotac ZT-P10810A-10P** tops the list with **157 units sold** and a total profit of **23,179.48**. This is followed closely by **Zion ZHY16004096 4 GB DDR3** and **Intel Xeon E5-2630 V4**, each selling **150 units** with profits of **22,500.00** and **17,856.00** respectively. Notably, **G.Skill RipjawsX** and **TridentX** both sold **149 units** but generated significantly higher profits, exceeding **290,000**, indicating a higher profit margin per unit. Interestingly, one product, **Hitachi A7K1000-1000**, had high sales but recorded **zero profit**, possibly due to pricing strategy or cost factors. This summary highlights not just popularity in sales but also the varying profitability across products.

## Visualization

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2014.png?raw=true)

# Q10: Show employee distribution among countries.

Understanding the employee distribution among countries provides valuable insights into the geographical allocation of human resources within the organization. This information is essential for evaluating staffing strategies, identifying regional strengths or gaps, and making data-driven decisions about recruitment, training, and operational expansion. Analyzing employee counts per country also helps assess whether workforce distribution aligns with business activity, demand, or warehouse presence in those regions. This can lead to more efficient resource planning, balanced workloads, and improved operational performance across global or multi-country operations.

## Solution
```sql
SELECT 
    r.CountryName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Warehouse w
JOIN Region r ON w.RegionID = r.RegionID
LEFT JOIN Employee e ON w.WarehouseID = e.WarehouseID
GROUP BY r.CountryName
ORDER BY EmployeeCount DESC;
```
This SQL query calculates the total number of employees per country by joining relevant tables. It first joins the `Warehouse` table with the `Region` table using the `RegionID` to retrieve each warehouse’s associated country (`CountryName`). Then it uses a `LEFT JOIN` to link the `Employee` table on `WarehouseID`, ensuring all countries are included—even those with warehouses that have no employees. The query groups the results by `CountryName` and counts the number of employees (`EmployeeID`) in each country. The final result is ordered in descending order to display countries with the highest number of employees at the top.

## Output
|countryname              |employeecount|
|-------------------------|-------------|
|United States of America |178          |
|Australia                |45           |
|China                    |45           |
|Mexico                   |45           |
|Canada                   |44           |
|India                    |43           |

The query reveals that the United States of America has the highest number of employees among all countries, with a total of 178 employees. This is followed by Australia, China, and Mexico, each employing 45 individuals. Canada and India also contribute significantly to the workforce with 44 and 43 employees respectively. This distribution indicates a strong concentration of personnel in the U.S., likely reflecting a higher number of warehouses or larger operational scale in that region compared to others.

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2017b.png?raw=true)

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2017a.png?raw=true)

# Q11: Which employees were hired in the Last 10 Years?

Identifying employees hired in the last 10 years is crucial for understanding workforce trends, recent recruitment efforts, and organizational growth. It helps highlight how much of the current workforce consists of newer hires versus long-standing staff, offering insights into employee turnover, succession planning, and talent acquisition strategies. This information is particularly valuable for HR and management teams to assess hiring effectiveness, plan training programs, and ensure that the organization is maintaining a healthy balance between experienced and new talent.

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
This SQL query retrieves information about employees who were hired within the last 10 years. It selects the `EmployeeID`, `EmployeeName`, `EmployeeJobTitle`, `EmployeeHireDate`, and the `WarehouseName` where each employee is assigned. The query joins the `Employee` table with the `Warehouse` table using the `WarehouseID` to associate each employee with their respective warehouse. The `WHERE` clause filters the results to include only those employees whose hire date is within the last 10 years from the current date, using the `CURRENT_DATE - INTERVAL '10 year'` condition. This helps in analyzing recent hiring patterns and identifying newly added staff across different warehouse locations.

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

The employee dataset showcases a diverse workforce distributed across multiple warehouse locations such as Southlake Texas, San Francisco, New Jersey, Seattle Washington, Toronto, Sydney, Mexico City, and Beijing. Most employees were hired in 2016 and span a wide range of job titles including Sales Representatives, Stock Clerks, Programmers, Accountants, Managers, and Clerks across departments like Sales, Shipping, Purchasing, and Human Resources. Southlake Texas has the highest concentration of employees, particularly in administrative, finance, and sales roles, while other warehouses have specialized roles aligned with local operational needs. Countrywise employee count visualizations aew shown in the following graphs.

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2018a.png?raw=true)

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2018b.png?raw=true)

# Q12: Find Revenue Contribution by State and Country.

Analyzing the revenue contribution by state and country is significant as it helps identify which geographic regions are driving the most business income, enabling strategic decision-making in marketing, resource allocation, and expansion planning. By understanding which states and countries contribute the highest revenue, the company can prioritize high-performing markets, address underperforming areas, and tailor its operations to regional demand. This insight also supports budgeting, sales forecasting, and helps optimize supply chain and distribution strategies for maximum profitability.

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
This SQL query calculates the total revenue generated from orders, grouped by state and country. It starts by selecting the country name and state from the `Region` table, then joins it with the `Warehouse` table using `RegionID`, connects to the `Employee` table via `WarehouseID`, and links to the `Orders` table, ensuring only valid customer orders are considered (`CustomerID IS NOT NULL`). It further joins with the `OrderDetails` table to access the quantity and unit price of items ordered. The total revenue is computed by multiplying `OrderItemQuantity` by `PerUnitPrice` for each order, then summing these values. The results are grouped by country and state to aggregate revenue regionally and sorted in descending order to highlight top-performing regions.

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

The revenue contribution analysis by state and country reveals that the highest total revenue, approximately 1.37 billion, was generated equally across several top-performing regions: Distrito Federal (Mexico), Washington and New Jersey (USA), New South Wales (Australia), and Beijing (China). These are followed by Texas, Ontario, and California, each contributing around 1.34 billion in revenue, and Maharashtra (India) with about 1.31 billion. This distribution indicates a strong and relatively balanced revenue performance among key states across multiple countries, suggesting a wide and effective geographic market presence.

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2021a.png?raw=true)

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2021b.png?raw=true)

# Q13: Display Warehouse Coverage by Country.

Understanding warehouse coverage by country is crucial for evaluating the geographic distribution and logistical efficiency of a company's supply chain. By identifying how many warehouses operate in each country, businesses can assess their ability to meet regional demand, reduce delivery times, and optimize inventory management. This insight also helps in strategic planning for expansion, identifying underserved regions, and ensuring balanced resource allocation across key markets, ultimately supporting better customer service and operational performance.

## Solution
```sql
SELECT 
    r.CountryName,
    COUNT(DISTINCT w.WarehouseID) AS NumberOfWarehouses
FROM Region r
JOIN Warehouse w ON r.RegionID = w.RegionID
GROUP BY r.CountryName;
```
This SQL query calculates the number of distinct warehouses operating in each country. It begins by selecting data from the `Region` table (aliased as `r`) and joins it with the `Warehouse` table (aliased as `w`) using the `RegionID` key, ensuring that each warehouse is correctly associated with its region and corresponding country. The query then uses `COUNT(DISTINCT w.WarehouseID)` to count the unique warehouses within each country, grouped by `CountryName`. The result is a summary table showing how many warehouses are present in each country, helping to analyze warehouse distribution across geographic locations.

## Output
|countryname             |numberofwarehouses|
|------------------------|------------------|
|Australia               |45                |
|Canada                  |44                |
|China                   |45                |
|India                   |43                |
|Mexico                  |45                |
|United States of America|178               |

The summary of warehouse coverage by country reveals that the United States has the highest number of warehouses, totaling 178, indicating a strong and widespread logistics network. Other countries like Australia, China, and Mexico each have 45 warehouses, showing balanced warehouse distribution in those regions. Canada follows closely with 44, while India has 43 warehouses, the lowest among the listed countries. This data highlights the geographic spread and infrastructure strength of the warehouse network across key international markets.

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2024b.png?raw=true)

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2024a.png?raw=true)
