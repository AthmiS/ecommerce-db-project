# E-Commerce Database Design & Query Optimization

## 📌 Project Overview
This project demonstrates a normalized relational database schema for a real-world E-Commerce platform. It covers the creation of structured tables, complex SQL joins, and performance benchmarking using indexing to optimize query execution speeds.

## 🛠️ Tech Stack
- **Database:** SQLite
- **Tool:** Visual Studio Code (SQLite Extension)
- **Language:** SQL

## 🗄️ Database Schema
The database consists of 5 normalized tables:
1. **Users:** Stores customer information.
2. **Categories:** Product classifications.
3. **Products:** Catalog of items linked to categories.
4. **Orders:** Record of customer purchases.
5. **Order_Items:** Detailed breakdown of products within each order.

## 🚀 Performance Optimization (The Benchmark)
The core objective was to reduce query execution time for searching products by their category.

### 1. Before Optimization (Table Scan)
Initially, searching for products by `category_id` required the database to scan every row.
- **Query:** `EXPLAIN QUERY PLAN SELECT * FROM products WHERE category_id = 5;`
- **Result:** `SCAN TABLE products`

### 2. After Optimization (Index Search)
I implemented a B-Tree Index on the `category_id` column to speed up retrieval.
- **SQL:** `CREATE INDEX idx_product_category ON products(category_id);`
- **Result:** `SEARCH TABLE products USING INDEX idx_product_category`

**Finding:** The optimization shifted the database from a linear O(N) scan to a logarithmic O(log N) search, significantly improving performance for large datasets.

## 📂 Files in this Repo
- `database.sql`: Full schema creation and table relationships.
- `queries.sql`: Complex JOIN queries for business insights.
- `optimization.sql`: Indexing scripts and performance testing.
-