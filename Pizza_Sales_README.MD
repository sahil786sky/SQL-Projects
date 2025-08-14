Pizza Sales Analysis (MSSQL Project)
1. Project Overview
  This project analyzes pizza sales data using Microsoft SQL Server (MSSQL).
  The goal is to extract key business insights such as best-selling products, revenue trends, and category performance using SQL queries.

2. Dataset
  Source: Dataset provided in "Dataset Pizza_Sales" folder
  
  Tables Used:
  orders → order timestamps
  order_details → line-level items with quantities
  pizzas → price and size details
  pizza_types → category and product info

3. Technologies Used
  Database: Microsoft SQL Server (MSSQL)
  
  SQL Concepts Used:
  Joins (INNER JOIN, LEFT JOIN)
  Aggregations (SUM, COUNT, AVG)
  Common Table Expressions (CTE)
  Grouping and Filtering (GROUP BY, HAVING)
  Sorting and Ordering (ORDER BY)

4. Repository Contents
  SQLProjectPizza_Sales.sql → Full SQL script with all queries
  Pizza_Sales_Report.pdf → Queries with screenshots and insights
  README.md → Project documentation

5. Key Insights
  Top 5 pizzas by sales quantity
  Revenue contribution by pizza category and size
  Average number of daily orders
  Most expensive pizzas and high-value customers
  Sales distribution over time

6. How to Use
  Ensure Microsoft SQL Server is installed and running.
  Restore/create the database with tables: orders, order_details, pizzas, pizza_types.
  Run SQLProjectPizza_Sales.sql in SQL Server Management Studio (SSMS).

Open Pizza_Sales_Report.pdf to view insights and query results.
