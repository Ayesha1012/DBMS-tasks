USE ecommerce_db;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Orders VALUES
(1001, 1, '2026-09-01', 599.00),
(1002, 2, '2026-09-02', 998.00),
(1003, 1, '2026-09-05', 499.00);

INSERT INTO Order_Details VALUES
(1, 1001, 101, 1, 599.00),
(2, 1002, 103, 2, 499.00),
(3, 1003, 103, 1, 499.00);

UPDATE Orders
SET total_amount = 1098.00
WHERE order_id = 1002;

SELECT Customer.customer_name, Orders.order_id, Orders.order_date, Orders.total_amount
FROM Customer
JOIN Orders ON Customer.customer_id = Orders.customer_id
ORDER BY Orders.order_date;
