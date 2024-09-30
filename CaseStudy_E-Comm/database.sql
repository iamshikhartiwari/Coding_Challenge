-- create database eCommerce;

-- use eCommerce;
-- Create the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);


-- Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    description VARCHAR(255),
    stockQuantity INT
);

-- Insert dummy data into products table
INSERT INTO products (product_id, name, price, description, stockQuantity) VALUES
(1, 'Smartphone', 15000.00, 'Latest Android Smartphone', 50),
(2, 'Laptop', 45000.00, 'High performance laptop', 30),
(3, 'Headphones', 2000.00, 'Wireless headphones', 100);

-- Create the cart table
CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert dummy data into cart table
INSERT INTO cart (cart_id, customer_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 5);

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    shipping_address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert dummy data into orders table
INSERT INTO orders (order_id, customer_id, order_date, total_price, shipping_address) VALUES
(1, 1, '2024-09-30', 30000.00, '123 MG Road, Delhi'),
(2, 2, '2024-09-29', 45000.00, '456 Bandra, Mumbai'),
(3, 3, '2024-09-28', 10000.00, '789 Electronic City, Bangalore');

-- Create the order_items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert dummy data into order_items table
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 5);
