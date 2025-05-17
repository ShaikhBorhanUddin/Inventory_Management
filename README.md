# 📦 Inventory Management Project 
<!-- Project Badges -->
![Made with](https://img.shields.io/badge/Made%20with-SQL-blue?logo=database)
![License](https://img.shields.io/github/license/ShaikhBorhanUddin/Inventory_Management_Project)
![Repo Size](https://img.shields.io/github/repo-size/ShaikhBorhanUddin/Inventory_Management_Project)
![Stars](https://img.shields.io/github/stars/ShaikhBorhanUddin/Inventory_Management_Project?style=social)
![Forks](https://img.shields.io/github/forks/ShaikhBorhanUddin/Inventory_Management_Project?style=social)
![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791?logo=postgresql&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-Data%20Visualization-E97627?logo=Tableau&logoColor=white)
![Git](https://img.shields.io/badge/Version%20Control-Git-orange?logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/Host-GitHub-black?logo=github)
![Project Status](https://img.shields.io/badge/Project-Completed-brightgreen?style=flat-square)
###
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/inventory.jpg?raw=true)

This project presents a full-scale Inventory Management System designed to provide businesses with a robust and efficient way to track products, manage stock levels, oversee suppliers, and monitor order movements. By leveraging SQL-based relational databases and data analysis tools, the system ensures data integrity, traceability, and performance insights crucial for inventory optimization.

## 📌 Project Overview
The goal of this project is to simulate the backend data management of a typical retail or wholesale inventory system. It focuses on building a scalable and normalized database schema that can handle complex relationships among products, suppliers, categories, and transactions. This system can serve as a foundation for more advanced inventory dashboards, analytics, and business intelligence tools.

The solution is built around structured datasets and SQL scripts that demonstrate the design and querying capabilities essential for real-world inventory systems.

✅ Key Features

- Product Categorization: Classify products into organized categories for easier browsing and analysis.
- Supplier Management: Store and manage supplier details including supplier-product relationships, contact info, and supply performance.
- Order Tracking: Keep track of customer orders and supplier purchase orders across different statuses such as pending, shipped, and delivered.
- Inventory Transactions: Log all incoming (purchases) and outgoing (sales) inventory movements to maintain real-time stock levels.
- Stock Alerts & Replenishment Insights: Identify products with low stock and suggest restocking based on predefined thresholds.
- Comprehensive Queries: Execute analytical SQL queries to gain insights into sales trends, supplier performance, inventory turnover, and more.
 
## 🗂️ Dataset Information

The raw csv files of the dataset can be accessed in the **Repository:** [Inventory Management Project](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/tree/main/Dataset). The database schema is designed following normalization principles to ensure data integrity and reduce redundancy. It consists of several interrelated tables that represent key entities involved in inventory management, including products, suppliers, categories, inventory transactions, and orders.
Below is a high-level overview of the core tables:

| Table Name        | Description |
|-------------------|-------------|
| **Product**       | Stores details of each product, including product ID, name, category, description, standard cost, list price, and profit margins. Essential for tracking inventory and pricing strategies. |
| **Customer**      | Contains customer records with customer ID, name, email, phone number, address, and credit limit. Helps in managing customer relations and order tracking. |
| **Region**        | Holds geographic information such as region name, country, state, city, and postal code. Supports location-based analysis for customers and warehouses. |
| **Orders**        | Tracks all customer orders with order date and associated customer. Central table for managing sales activities and customer order history. |
| **OrderDetails**  | Line-item details for each order, including quantity, per unit price, order status, and references to products and orders. Crucial for sales and inventory reconciliation. |
| **Warehouse**     | Information about warehouse facilities, including warehouse name, address, and linked region. Important for logistics and stock distribution. |
| **Employee**      | Records employee details such as name, email, phone, hire date, job title, and assigned warehouse. Useful for workforce management and warehouse operations. |

## ER Diagram
The Entity-Relationship Diagram (ERD) visually represents the relationships between these tables, illustrating primary and foreign key constraints to ensure proper data flow and referential integrity.

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/ER_Diagram.png?raw=true)

The database schema is composed of two distinct entity clusters, which are not entirely coneected. Sales/transaction cluster involves customer purchase, products and orders. Operations/HR cluster covers warehouse, employees and regional information. There are no links between product/orders with warehouse, which means it is not possible to trace
- Where a product is stored
- Which warehouse fulfilled an order
- Which employy handled an order

Altering `product` table or linking with `warehouse` by foreign key without real data will violate data integrity which would be analytically dishonest.

## 🛠️ Setup

To run this project locally:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/ShaikhBorhanUddin/Inventory_Management_Project.git
   ```

2. **Open SQL environment (e.g., postgreSQL, MySQL Workbench, or terminal).**

3. **Run the SQL script**
   - Open `Inventory_management_updated.sql`.
   - Execute the script to create the database, tables, and run queries.
   - From query results, it is possible to generate graphs in PowerBI or Tableau

## 📁 Folder Structure
```bash
Inventory_Management/
│
├── Dataset/                                    # Contains raw CSV files
├── Images/                                     # Tableau Visualization
├── Inventory_management_updated.sql            # SQL scripts for business insights and reporting
├── Licence
├── README.md                                   # Overvier of the project
└── Solutions.md                                # Query solution documentation
```
## ❓ Analytic Questions

This project answers a wide range of business-critical questions using SQL queries and Tableau visualizations. Considering the limitations of the dataset (no link beween sales and HR data), these analytics are designed to empower decision-makers with actionable insights into sales, customer behavior, and operational efficiency. The questions are given below

1. **What are the top 5 products with the highest total revenue, considering OrderItemQuantity and PerUnitPrice?**
2. **Which customers have spent the most money, and what is their total spending? (Top 10 customers by total spending)**
3. **Which product category generates the top 3 highest total revenue?**
4. **Which month had the highest total sales revenue?**
5. **Which warehouse has handled the highest total order quantity?**
6. **Which employee has processed the highest number of orders?**
7. **What is the average order value (AOV) per customer?**
8. **Which region generates the highest total revenue?**
9. **Which product has the highest profit margin, and what is the margin percentage?**
10. **Which day of the week has the highest total sales revenue?**
11. **Which customers has placed the highest number of orders?**
12. **Which employee has been working the longest (oldest hire date)?**
13. **Which product category has generated the highest total revenue?**
14. **Which warehouse has the highest total inventory cost (sum of ProductStandardCost for all stored products)?**
15. **Which product has the highest total quantity sold?**
16. **Which orders were cancelled?**
17. **List number of employees per Warehouse with Country Name.**
18. **Which employees were hired in the Last 10 Years?**
19. **Find Total Orders Fulfilled by Region**
20. **Find Product Distribution by City**
21. **Find Revenue Contribution by State and Country.**
22. **Display Top Warehouses by Employee Count and Sales**
23. **Show Employee Roster by Region.**
24. **Display Warehouse Coverage by Country.**

Understanding and analyzing these questions is essential for transforming raw data into meaningful business intelligence. For example, identifying the top-performing products, categories, and regions helps organizations focus on areas that generate the most revenue and profit. By analyzing customer spending habits and order frequency, businesses can design more effective marketing strategies, improve customer retention, and tailor offerings to meet customer needs.

Operationally, knowing which warehouses handle the most orders and which employees process the highest volume provides clarity into the performance of supply chain and fulfillment operations. This supports better resource allocation, helps manage workloads, and highlights areas where process improvements may be needed. Time-based trends, such as revenue fluctuations by month or day of the week, reveal seasonality and customer behavior patterns, which are crucial for inventory planning and promotional campaigns.

Analyzing profit margins allows businesses to pinpoint which products yield the highest returns, informing pricing strategies and product portfolio decisions. Similarly, understanding geographic revenue distribution at the city, state, and country levels enables smarter decisions about market expansion, localized promotions, and distribution strategies. Insights into employee distribution, hiring trends, and tenure further support human resources planning and operational scalability.

Together, these analyses contribute to a holistic view of the business, allowing stakeholders to make informed, data-driven decisions and continuously optimize performance across departments. Detailed solutions and visualizations are documented in the [solutions.md](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/solutions.md) file.

## 🧠 Sample Queries
SQL codes of some of these queries with explanations are included here.
```sql
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
This query identifies the top 10 customers by total spending, which is crucial for business analytics as it highlights the most valuable clients driving revenue. Understanding who spends the most helps businesses prioritize customer retention, tailor marketing efforts, and allocate resources effectively to maximize profitability and customer lifetime value. The SQL query joins the `Orders`, `Customer`, and `OrderDetails` tables to calculate total spending per customer by multiplying the quantity of each item (`OrderItemQuantity`) by its unit price (`PerUnitPrice`). It then groups the results by customer ID and name, aggregates the spending using SUM(), and orders the output in descending order to identify the top 10 highest-spending customers. This approach ensures accurate revenue attribution per customer and is efficient for pinpointing key contributors to overall sales.
```sql
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
This query determines which warehouse has handled the highest total order quantity by joining `OrderDetails` with `Product` and `Warehouse`, then aggregating the total quantity of items ordered (`OrderItemQuantity`) per warehouse. It uses SUM() to compute total quantities, groups by warehouse, and sorts the result in descending order to return the top performer. This query is important for business analytics because it helps identify the most active warehouse, offering insights into operational load, resource utilization, and logistical efficiency, which are essential for inventory planning, workforce allocation, and scaling distribution capabilities.
```sql
SELECT 
    p.CategoryName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.CategoryName
ORDER BY TotalRevenue DESC
LIMIT 1;
```
This query calculates the total revenue generated by each product category by joining `OrderDetails` with `Product` and multiplying the quantity ordered by the unit price. It then groups the data by category, sums the revenue, and returns the category with the highest total. This analysis is vital for business intelligence as it reveals which product category is the most profitable, helping businesses focus their marketing, inventory stocking, and product development strategies on high-performing segments to maximize revenue and market share.
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
This query calculates the total revenue contributed by each state and country by aggregating order revenue (`OrderItemQuantity` * `PerUnitPrice`) and grouping it by geographical region. It joins the `Region`, `Warehouse`, `Employee`, `Orders`, and `OrderDetails` tables to trace the flow of transactions through regional warehouses and responsible employees. This analysis is crucial for understanding geographic performance, enabling businesses to identify high-revenue areas, allocate resources strategically, and make data-driven decisions about regional marketing, distribution, and expansion efforts.

## Tableau Visualization
Some visualizations drrived from sql queries involving employees, revenue and warwhouse are included here.

## 👥 Employee Count by Warehouse and Country

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2017b.png?raw=true)

This bar chart visualizes the number of employees assigned to warehouses across different countries. Each bar represents a country, and the length of the bar corresponds to the total number of employees in warehouses located within that country. This chart enables a quick comparison of workforce distribution, highlighting regions with high employee concentrations and identifying countries with relatively fewer resources. It’s an essential tool for understanding how workforce allocation aligns with operational needs, helping businesses optimize staffing strategies and ensure that warehouses are adequately supported in various regions.

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2017a.png?raw=true)

The same information in world map visualization displays the number of employees assigned to warehouses across different countries. Here, each country is color-coded to represent the total employee count in its warehouses, with darker shades indicating higher numbers of employees. This map provides a global view of workforce distribution, enabling quick identification of regions with more or fewer resources. It is a valuable tool for understanding how employee allocation aligns with operational needs across different countries, helping businesses make data-driven decisions regarding workforce optimization, recruitment, and warehouse management in various regions.

## 🧑‍💼 Employees Hired in the Last 10 Years

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2018a.png?raw=true)

This visualization highlights the number of employees hired within the last 10 years, offering insights into workforce growth and hiring trends over time. It provides a clear breakdown of hiring activity, allowing businesses to identify potential staffing gaps. Analyzing this data helps organizations assess the effectiveness of their hiring strategies, align workforce planning with business growth, and forecast future recruitment needs. Understanding employee tenure also aids in identifying long-term trends and ensuring a balanced, skilled workforce moving forward.

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2018b.png?raw=true)

This visualization provides similar visualization with additional year-wise breakdown of employees hired over the past 10 years, illustrating recruitment trends and workforce expansion on a yearly basis. Each bar represents the total number of employees hired in a specific year, allowing for easy identification of hiring peaks or downturns. By analyzing this year-wise distribution, businesses can gain insights into their recruitment strategies, track workforce growth over time, and identify patterns in hiring that may correlate with business cycles or changes in operational demand. This data is essential for making informed decisions about future hiring and workforce management.

## 💰 Revenue Contribution by Country

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2021a.png?raw=true)

This bar chart presents a comparison of total revenue generated by each country, with each bar representing a country’s overall contribution. The height of the bar reflects the total sales revenue attributed to that country, making it easy to identify top-performing markets. This visualization is crucial for evaluating geographic revenue distribution, helping businesses recognize which countries drive the most income. These insights support strategic decisions related to market prioritization, regional investments, and tailored sales or marketing efforts to maximize revenue across different regions.

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2021b.png?raw=true)

This world map visualization plots states across different countries where revenue has been recorded, with each state marked in blue regardless of its revenue value. While color is not used to indicate the level of contribution, the visualization still provides a clear geographical representation of where sales activities are concentrated. This allows businesses to visually assess the global footprint of their revenue-generating regions and understand market coverage at the state level. When paired with detailed revenue figures or accompanying charts, this map becomes a helpful tool for identifying regions involved in business operations and guiding expansion or strategic planning efforts.

## 🏢 Worldwide Warehouse Distribution

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2024b.png?raw=true)

This bar chart illustrates the distribution of warehouses across different countries, with each bar representing the number of warehouses located in a specific country. The chart provides a clear comparison of global warehouse presence, helping businesses understand how their logistics infrastructure is spread geographically. This insight is essential for evaluating supply chain reach, identifying regions with strong fulfillment capabilities, and spotting areas that may benefit from additional warehousing investment. A well-balanced warehouse distribution supports faster delivery, reduced shipping costs, and improved customer satisfaction across markets.

![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Images/Sheet%2024a.png?raw=true)

This world map visualizes the total number of warehouses in each country, offering a high-level view of global distribution. Instead of marking individual warehouse locations, the map displays countries based on the presence and count of warehouses, giving a clear picture of where operational infrastructure is concentrated. This visualization helps stakeholders quickly assess the company’s logistical coverage worldwide, identify strategically important regions, and recognize areas that may require further development to support growth and improve delivery efficiency.

## ✅ Future Improvements

To enhance the functionality and usability of the Inventory Management System, several future improvements are planned. These include implementing automated triggers to ensure real-time stock updates, which will improve inventory accuracy and operational efficiency. A front-end dashboard integration is also envisioned to provide interactive visualizations and easier access to key metrics for stakeholders. Additionally, incorporating stored procedures will help streamline complex transactions and enforce consistent business logic at the database level. Finally, expanding the system’s reporting capabilities—such as generating monthly stock summaries and evaluating supplier performance—will support deeper business insights and data-driven decision-making.

## 💡 Tools Used

**`PostgreSQL`** **`Tableau`** **`Microsoft Excel`**

PostgreSQL was the primary database management system used for this project, designed to efficiently store, manage, and query the unicorn company dataset. We executed complex SQL queries to extract insights on valuation trends, industry diversity, regional growth patterns, and more. Its strong support for joins, aggregations, and window functions made it ideal for analytical exploration.

For data visualization and storytelling, we utilized Tableau. The insights generated through SQL were visually represented with interactive dashboards and charts, allowing for clearer recognition of patterns and comparisons. From bar charts and treemaps to time series and world maps, Tableau effectively transformed raw data into intuitive and visually compelling narratives.

Excel played a critical role in the initial data cleaning, quick summaries, and exploratory analysis. It was also used to format raw CSV files before importing them into PostgreSQL, as well as to create pivot tables and supplementary charts for deeper inspection of individual metrics.

Together, these tools formed a robust end-to-end workflow that encompassed querying, analysis, visualization, and presentation.
## 📄 License

This project is licensed under the **MIT License** — a permissive open-source license that allows reuse, modification, and distribution with attribution. You are free to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the project, provided that the original copyright and license notice are included in all copies or substantial portions of the software.

For more details, refer to the [Licence](https://github.com/ShaikhBorhanUddin/Inventory_Management/blob/main/Licence) file in this repository.

## 🤝 Contributing

Contributions are welcome! If you have ideas to improve this project, feel free to open an issue or submit a pull request.

