USE ecommerce_db;

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(30),
    payment_date DATE,
    payment_status VARCHAR(20),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Payment VALUES
(1, 1001, 'UPI', '2026-09-01', 'Successful', 599.00),
(2, 1002, 'Card', '2026-09-02', 'Successful', 1098.00),
(3, 1003, 'Cash', '2026-09-05', 'Failed', 499.00);

SELECT * FROM Payment
WHERE payment_status = 'Successful';

SELECT * FROM Payment
WHERE payment_status = 'Failed';

SELECT payment_mode, COUNT(*) AS total_transactions
FROM Payment
GROUP BY payment_mode;

SELECT Payment.payment_id, Orders.order_id, Payment.payment_mode,
       Payment.payment_date, Payment.payment_status, Payment.amount
FROM Payment
JOIN Orders ON Payment.order_id = Orders.order_id;
