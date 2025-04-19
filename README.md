# Inventory Management Project 📦
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

> **Repository:** [Inventory Management Project](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/tree/main/Dataset)

## 🗂️ Project Structure

  This SQL script contains:
  - Database creation
  - Table definitions
  - Data insertion
  - Useful queries for inventory analysis

## 📌 Features

🗂️ Database Tables & Descriptions

| Table Name        | Description |
|-------------------|-------------|
| **Product**       | Stores details of each product, including product ID, name, category, description, standard cost, list price, and profit margins. Essential for tracking inventory and pricing strategies. |
| **Customer**      | Contains customer records with customer ID, name, email, phone number, address, and credit limit. Helps in managing customer relations and order tracking. |
| **Region**        | Holds geographic information such as region name, country, state, city, and postal code. Supports location-based analysis for customers and warehouses. |
| **Orders**        | Tracks all customer orders with order date and associated customer. Central table for managing sales activities and customer order history. |
| **OrderDetails**  | Line-item details for each order, including quantity, per unit price, order status, and references to products and orders. Crucial for sales and inventory reconciliation. |
| **Warehouse**     | Information about warehouse facilities, including warehouse name, address, and linked region. Important for logistics and stock distribution. |
| **Employee**      | Records employee details such as name, email, phone, hire date, job title, and assigned warehouse. Useful for workforce management and warehouse operations. |


- **Data Manipulation**  
  Insert, update, and manage inventory records seamlessly.

- **Analytical Queries**  
  Retrieve insights such as:
  - Stock availability
  - Supplier details
  - Inventory movements
  - Product reorder levels
  - Sales and order tracking

- **Scalability Ready**  
  The database schema is designed to be scalable for future enhancements and reporting.
## ER Diagram
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/ER_Diagram.png?raw=true)
## 🛠️ Technologies Used

- **SQL**
- **PostgreSQL** *(Recommended, but works with other RDBMS with minor adjustments)*
- **Tableau**
## 🚀 Getting Started

To run this project locally:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/ShaikhBorhanUddin/Inventory_Management_Project.git
   ```

2. **Open your SQL environment (e.g., pgAdmin, DBeaver, or terminal).**

3. **Run the SQL script**
   - Open `Inventory_management.sql`.
   - Execute the script to create the database, tables, and insert initial data.

## ❓ Query Questions

The following business questions are answered (with Tableau visualization) using this project’s SQL queries:

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

## 📊 Sample Queries

- **Check current inventory levels:**
   ```sql
   SELECT product_name, quantity_in_stock FROM products;
   ```

- **View products below reorder level:**
   ```sql
   SELECT product_name FROM products WHERE quantity_in_stock < reorder_level;
   ```

- **Supplier details for specific products:**
   ```sql
   SELECT p.product_name, s.supplier_name 
   FROM products p
   JOIN suppliers s ON p.supplier_id = s.supplier_id;
   ```

- **List pending orders:**
   ```sql
   SELECT order_id, product_id, quantity, status 
   FROM orders 
   WHERE status = 'Pending';
   ```

- **Total inventory value by product:**
   ```sql
   SELECT product_name, quantity_in_stock * price AS inventory_value 
   FROM products;
   ```

## ✅ Future Improvements

- Add automated triggers for stock updates.
- Integrate with a front-end dashboard for visualization.
- Implement stored procedures for complex transactions.
- Enhance reporting features (monthly stock report, supplier performance, etc.).

## 🤝 Contributing

Contributions are welcome! If you have ideas to improve this project, feel free to open an issue or submit a pull request.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
