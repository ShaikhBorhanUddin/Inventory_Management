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
This project explores the Brazilian E-Commerce Public Dataset by Olist using PostgreSQL. The goal is to build a relational database to manage and analyze inventory, sales, and customer data, and to provide actionable insights into the performance of products, sellers, and logistics. By leveraging the dataset, this project aims to:
- Build a structured and scalable relational database schema for effective inventory management.
- Conduct detailed analysis to track product stock levels, identify reorder points, and optimize inventory turnover.
- Analyze sales trends to forecast demand, identify best-selling products, and improve stock planning.
- Gain insights into customer behavior, such as product preferences and purchasing patterns.
- Evaluate seller performance, logistics efficiency, and fulfillment timelines to enhance the supply chain process.

The Inventory Management System will incorporate features such as product categorization, supplier management, order tracking, and inventory transactions. The analytical queries will help identify potential improvements in stock management, supplier relationships, and sales forecasting, ultimately enhancing operational efficiency.

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
