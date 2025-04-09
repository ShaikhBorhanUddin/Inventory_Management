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

This project is a SQL-based Inventory Management System designed to manage and analyze inventory data efficiently. It includes creating tables, inserting data, and performing queries for better inventory control and decision-making.

> **Repository:** [Inventory Management Project](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project)

## 🗂️ Project Structure

- `Inventory_management.sql`  
  This SQL script contains:
  - Database creation
  - Table definitions
  - Data insertion
  - Useful queries for inventory analysis

## 📌 Features

- **Database Schema Design**  
  Structured tables to store inventory data, including:
  - Products
  - Categories
  - Suppliers
  - Inventory Transactions
  - Orders

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

## 🛠️ Technologies Used

- **SQL**
- **PostgreSQL** *(Recommended, but works with other RDBMS with minor adjustments)*

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

The following business questions can be answered using this project’s SQL queries:

1. **What are the details of all products?**
2. **List all suppliers.**
3. **Get details of all categories.**
4. **Show all inventory transactions.**
5. **Retrieve all orders.**
6. **Find products with quantity in stock less than 100.**
7. **List suppliers from a specific city ('New York').**
8. **Get total quantity in stock for each category.**
9. **Find the supplier name for each product.**
10. **List products along with their category names.**
11. **Show the total number of products supplied by each supplier.**
12. **Get the total inventory value (quantity_in_stock * price) for each product.**
13. **List products that have never been ordered.**
14. **Find the most recent inventory transactions.**
15. **Retrieve pending orders.**
16. **List completed orders.**

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
