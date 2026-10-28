-- Task XV: E-Commerce Intelligence Platform
-- Run this file first in MySQL 8.0+
CREATE DATABASE IF NOT EXISTS ecommerce_capstone;
USE ecommerce_capstone;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(60)
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    city VARCHAR(60)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    seller_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    order_status VARCHAR(30) NOT NULL DEFAULT 'Placed',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_mode VARCHAR(30) NOT NULL,
    payment_date DATE,
    payment_status VARCHAR(30) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    review_text VARCHAR(500),
    review_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Rating (
    rating_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    rating INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    seller_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Fictional sample customers
INSERT INTO Customer VALUES
(1, 'Ananya Rao', 'ananya@example.com', '9000000001', 'Chennai'),
(2, 'Karthik Kumar', 'karthik@example.com', '9000000002', 'Coimbatore'),
(3, 'Meera Nair', 'meera@example.com', '9000000003', 'Chennai'),
(4, 'Rahul Das', 'rahul@example.com', '9000000004', 'Madurai'),
(5, 'Divya Shah', 'divya@example.com', '9000000005', 'Bengaluru');

INSERT INTO Category VALUES
(1, 'Electronics'), (2, 'Books'), (3, 'Home'), (4, 'Accessories');

INSERT INTO Seller VALUES
(1, 'Bright Tech Store', 'Chennai'),
(2, 'Paper Tree Books', 'Coimbatore'),
(3, 'Everyday Home', 'Madurai');

INSERT INTO Product VALUES
(101, 'Wireless Mouse', 1, 799.00, 40, 1),
(102, 'USB Keyboard', 1, 1199.00, 25, 1),
(103, 'SQL Basics Book', 2, 499.00, 60, 2),
(104, 'Desk Lamp', 3, 899.00, 18, 3),
(105, 'Laptop Sleeve', 4, 599.00, 30, 1),
(106, 'Data Structures Book', 2, 699.00, 35, 2),
(107, 'Water Bottle', 3, 299.00, 50, 3);

INSERT INTO Orders VALUES
(1001, 1, '2026-09-01', 1598.00, 'Completed'),
(1002, 2, '2026-09-03', 1199.00, 'Completed'),
(1003, 1, '2026-09-12', 998.00, 'Completed'),
(1004, 3, '2026-09-15', 1498.00, 'Placed'),
(1005, 4, '2026-09-20', 899.00, 'Completed'),
(1006, 5, '2026-09-22', 1298.00, 'Completed');

INSERT INTO Order_Details VALUES
(1, 1001, 101, 2, 799.00),
(2, 1002, 102, 1, 1199.00),
(3, 1003, 103, 2, 499.00),
(4, 1004, 105, 1, 599.00),
(5, 1004, 106, 1, 699.00),
(6, 1005, 104, 1, 899.00),
(7, 1006, 105, 1, 599.00),
(8, 1006, 103, 1, 499.00),
(9, 1001, 107, 0, 299.00);

INSERT INTO Payment VALUES
(501, 1001, 'UPI', '2026-09-01', 'Successful', 1598.00),
(502, 1002, 'Card', '2026-09-03', 'Successful', 1199.00),
(503, 1003, 'UPI', '2026-09-12', 'Successful', 998.00),
(504, 1004, 'Card', '2026-09-15', 'Pending', 1498.00),
(505, 1005, 'Cash', '2026-09-20', 'Successful', 899.00),
(506, 1006, 'UPI', '2026-09-22', 'Successful', 1298.00);

INSERT INTO Review VALUES
(1, 1, 101, 'Works well for daily use.', '2026-09-05'),
(2, 2, 102, 'Comfortable keys.', '2026-09-08'),
(3, 3, 104, 'Good light for a desk.', '2026-09-18');

INSERT INTO Rating VALUES
(1, 1, 101, 5), (2, 2, 102, 4), (3, 3, 104, 4),
(4, 4, 103, 5), (5, 5, 105, 4);

INSERT INTO Inventory VALUES
(1, 1, 101, 40), (2, 1, 102, 25), (3, 2, 103, 60),
(4, 3, 104, 18), (5, 1, 105, 30), (6, 2, 106, 35),
(7, 3, 107, 50);
