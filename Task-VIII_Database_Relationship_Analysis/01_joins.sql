USE ecommerce_db;

-- 1. INNER JOIN
-- Shows customers who have placed orders.
SELECT Customer.customer_name, Orders.order_id, Orders.order_date, Orders.total_amount
FROM Customer
INNER JOIN Orders
ON Customer.customer_id = Orders.customer_id;

-- 2. INNER JOIN with Product
-- Shows the products included in each order.
SELECT Orders.order_id, Customer.customer_name,
       Product.product_name, Order_Details.quantity,
       Order_Details.price
FROM Orders
INNER JOIN Customer
ON Orders.customer_id = Customer.customer_id
INNER JOIN Order_Details
ON Orders.order_id = Order_Details.order_id
INNER JOIN Product
ON Order_Details.product_id = Product.product_id;

-- 3. LEFT JOIN
-- Shows all customers, including customers who have not placed an order.
SELECT Customer.customer_name, Orders.order_id, Orders.order_date
FROM Customer
LEFT JOIN Orders
ON Customer.customer_id = Orders.customer_id;

-- 4. RIGHT JOIN
-- Shows all orders and their customer details.
SELECT Customer.customer_name, Orders.order_id,
       Orders.order_date, Orders.total_amount
FROM Customer
RIGHT JOIN Orders
ON Customer.customer_id = Orders.customer_id;

-- 5. Complete order details
-- Combines Customer, Orders, Order_Details, Product and Payment.
SELECT Customer.customer_name,
       Orders.order_id,
       Orders.order_date,
       Product.product_name,
       Order_Details.quantity,
       Order_Details.price,
       Orders.total_amount,
       Payment.payment_mode,
       Payment.payment_status
FROM Customer
INNER JOIN Orders
ON Customer.customer_id = Orders.customer_id
INNER JOIN Order_Details
ON Orders.order_id = Order_Details.order_id
INNER JOIN Product
ON Order_Details.product_id = Product.product_id
LEFT JOIN Payment
ON Orders.order_id = Payment.order_id;

-- 6. Customer purchase history
SELECT Customer.customer_name,
       Orders.order_id,
       Orders.order_date,
       Product.product_name,
       Order_Details.quantity,
       Order_Details.price
FROM Customer
INNER JOIN Orders
ON Customer.customer_id = Orders.customer_id
INNER JOIN Order_Details
ON Orders.order_id = Order_Details.order_id
INNER JOIN Product
ON Order_Details.product_id = Product.product_id
ORDER BY Customer.customer_name, Orders.order_date;

-- 7. Multi-table payment report
SELECT Customer.customer_name,
       Orders.order_id,
       Payment.payment_mode,
       Payment.payment_date,
       Payment.payment_status,
       Payment.amount
FROM Customer
INNER JOIN Orders
ON Customer.customer_id = Orders.customer_id
INNER JOIN Payment
ON Orders.order_id = Payment.order_id;
