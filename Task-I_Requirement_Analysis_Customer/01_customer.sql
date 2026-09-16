CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(200)
);

INSERT INTO Customer VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', '9876543210', 'Chennai'),
(2, 'Diya Kumar', 'diya@gmail.com', '9876543211', 'Bangalore'),
(3, 'Rahul Singh', 'rahul@gmail.com', '9876543212', 'Mumbai');

SELECT * FROM Customer;
