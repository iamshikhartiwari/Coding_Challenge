-- create the database;
create database eCommerce;

use eCommerce;

-- Create the customers table

-- CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name NVARCHAR(100),
    email NVARCHAR(100),
    password NVARCHAR(100)
);

-- Insert 10 dummy rows into customers table
INSERT INTO customers (customer_id, name, email, password) VALUES
(1, N'Rahul Sharma', 'rahul.sharma@example.com', 'password123'),
(2, N'Priya Patel', 'priya.patel@example.com', 'password456'),
(3, N'Amit Verma', 'amit.verma@example.com', 'password789'),
(4, N'Sneha Desai', 'sneha.desai@example.com', 'password101'),
(5, N'Vikram Singh', 'vikram.singh@example.com', 'password102'),
(6, N'Anjali Nair', 'anjali.nair@example.com', 'password103'),
(7, N'Ravi Mehta', 'ravi.mehta@example.com', 'password104'),
(8, N'Kavita Rao', 'kavita.rao@example.com', 'password105'),
(9, N'Manish Gupta', 'manish.gupta@example.com', 'password106'),
(10, N'Sanjay Iyer', 'sanjay.iyer@example.com', 'password107');

-- Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name NVARCHAR(100),
    price DECIMAL(10, 2),
    description NVARCHAR(255),
    stockQuantity INT
);

-- -- Insert 10 dummy rows into products table
INSERT INTO products (product_id, name, price, description, stockQuantity) VALUES
(1, N'Smartphone', 15000.00, N'Latest Android Smartphone', 50),
(2, N'Laptop', 45000.00, N'High performance laptop', 30),
(3, N'Headphones', 2000.00, N'Wireless headphones', 100),
(4, N'Tablet', 25000.00, N'Android tablet with 10-inch screen', 40),
(5, N'Smartwatch', 5000.00, N'Fitness tracking smartwatch', 80),
(6, N'Bluetooth Speaker', 3000.00, N'Portable Bluetooth speaker', 60),
(7, N'Gaming Console', 35000.00, N'Next-gen gaming console', 20),
(8, N'DSLR Camera', 55000.00, N'High-quality DSLR camera', 15),
(9, N'External Hard Drive', 4000.00, N'1TB external hard drive', 70),
(10, N'Power Bank', 1500.00, N'10000mAh power bank', 120);

-- Create the cart table
CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES customers(customer_id),
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    quantity INT
);

-- -- Insert 10 dummy rows into cart table
INSERT INTO cart (cart_id, customer_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 5),
(4, 4, 4, 1),
(5, 5, 5, 2),
(6, 6, 6, 3),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 4),
(10, 10, 10, 3);

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES customers(customer_id),
    order_date DATE,
    total_price DECIMAL(10, 2),
    shipping_address NVARCHAR(255)
);


-- Insert 10 dummy rows into orders table
INSERT INTO orders (order_id, customer_id, order_date, total_price, shipping_address) VALUES
(1, 1, '2024-09-30', 30000.00, N'123 MG Road, Delhi'),
(2, 2, '2024-09-29', 45000.00, N'456 Bandra, Mumbai'),
(3, 3, '2024-09-28', 10000.00, N'789 Electronic City, Bangalore'),
(4, 4, '2024-09-27', 25000.00, N'101 Koregaon Park, Pune'),
(5, 5, '2024-09-26', 10000.00, N'102 Salt Lake, Kolkata'),
(6, 6, '2024-09-25', 9000.00, N'103 Banjara Hills, Hyderabad'),
(7, 7, '2024-09-24', 35000.00, N'104 Civil Lines, Jaipur'),
(8, 8, '2024-09-23', 55000.00, N'105 MG Road, Chennai'),
(9, 9, '2024-09-22', 4000.00, N'106 Gandhi Nagar, Ahmedabad'),
(10, 10, '2024-09-21', 4500.00, N'107 Indiranagar, Bangalore');

-- Create the order_items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT FOREIGN KEY REFERENCES orders(order_id),
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    quantity INT
);

-- Insert 10 dummy rows into order_items table
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 5),
(4, 4, 4, 1),
(5, 5, 5, 2),
(6, 6, 6, 3),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 4),
(10, 10, 10, 3);
