USE ecommerce_db;

INSERT INTO orders
(order_id, customer_id, order_date, total_amount)
VALUES
(1001, 1, '2026-09-01', 599.00),
(1002, 2, '2026-09-02', 998.00),
(1003, 1, '2026-09-05', 499.00);

INSERT INTO order_details
(order_detail_id, order_id, product_id, quantity, price)
VALUES
(1, 1001, 101, 1, 599.00),
(2, 1002, 103, 2, 499.00),
(3, 1003, 103, 1, 499.00);

UPDATE orders
SET total_amount = 998.00
WHERE order_id = 1002;

SELECT
    customer.customer_name,
    orders.order_id,
    orders.order_date,
    orders.total_amount
FROM customer
JOIN orders
ON customer.customer_id = orders.customer_id
ORDER BY orders.order_date;

SELECT
    orders.order_id,
    customer.customer_name,
    product.product_name,
    order_details.quantity,
    order_details.price,
    orders.order_date,
    orders.total_amount
FROM orders
JOIN customer
ON orders.customer_id = customer.customer_id
JOIN order_details
ON orders.order_id = order_details.order_id
JOIN product
ON order_details.product_id = product.product_id
ORDER BY orders.order_date;ame, Orders.order_id, Orders.order_date, Orders.total_amount
FROM Customer
JOIN Orders ON Customer.customer_id = Orders.customer_id
ORDER BY Orders.order_date;
