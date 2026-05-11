# E-Commerce Database: Design & Query Optimization 🚀

## 📌 Project Overview
This repository contains a professional-grade relational database schema designed for an E-Commerce platform. The project focuses on **Database Normalization (3NF)**, **Data Integrity**, and **Query Performance Optimization** using SQLite.

## 🛠️ Tech Stack
- **Database Engine:** SQLite 3
- **Environment:** Visual Studio Code
- **Language:** SQL

## 🏗️ Database Architecture
The system is built on a highly normalized structure consisting of five core tables:
- **`users`**: Manages customer profiles with unique identity constraints.
- **`categories`**: Organizes products into logical groupings.
- **`products`**: Maintains the inventory catalog with price validation.
- **`orders`**: Tracks customer transactions.
- **`order_items`**: Handles many-to-many relationships between orders and products.

## ⚡ Performance Optimization Strategy
The standout feature of this project is the transition from a linear search to an optimized index-based search.

### The Problem: Table Scanning
Without optimization, filtering products by `category_id` forces the engine to perform a **Full Table Scan**, which is inefficient as the dataset grows ($O(n)$ complexity).

### The Solution: B-Tree Indexing
I implemented a manual B-Tree index on the foreign key column:
```sql
CREATE INDEX idx_product_category_lookup ON products(category_id);
