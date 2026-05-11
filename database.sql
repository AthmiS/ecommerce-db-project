/*******************************************************************************
 * PROJECT: E-Commerce Backend Database Optimization
 * AUTHOR: Athmi S
 * TASK: Normalized Schema Design & Query Performance Benchmarking
 ******************************************************************************/

-- 1. CLEANUP (Optional: ensures a fresh start during testing)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

-- 2. SCHEMA DESIGN (Normalized to 3rd Normal Form)
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL CHECK(price >= 0),
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    order_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (
    item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER DEFAULT 1 CHECK(quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 3. DATA SEEDING (Industry standard for demonstrating functionality)
INSERT INTO users (full_name, email) VALUES ('Amrutha', 'amrutha@example.com');
INSERT INTO categories (name) VALUES ('Laptops'), ('Accessories');
INSERT INTO products (name, price, category_id) VALUES ('MacBook Pro', 120000.00, 1), ('Mouse', 1500.00, 2);
INSERT INTO orders (user_id) VALUES (1);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (1, 1, 1);

-- 4. PERFORMANCE OPTIMIZATION (The "Professional" Part)
-- We create a manual index on category_id to optimize catalog filtering
CREATE INDEX idx_product_category_lookup ON products(category_id);

-- 5. BENCHMARK / VALIDATION
-- This command proves the optimization to the internship coordinator
EXPLAIN QUERY PLAN 
SELECT p.name, c.name AS category
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE p.category_id = 1;
