-- Task XV: Reports and database objects
-- Run after 01_capstone_setup.sql
USE ecommerce_capstone;

-- 1. Complete order details
SELECT c.customer_name, o.order_id, o.order_date, p.product_name,
       od.quantity, od.price, o.total_amount, pay.payment_mode, pay.payment_status
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Product p ON od.product_id = p.product_id
LEFT JOIN Payment pay ON o.order_id = pay.order_id
ORDER BY o.order_date, o.order_id;

-- 2. Total sales and order count
SELECT COUNT(*) AS order_count,
       SUM(total_amount) AS total_order_value,
       AVG(total_amount) AS average_order_value,
       MIN(total_amount) AS smallest_order,
       MAX(total_amount) AS largest_order
FROM Orders;

-- 3. Customer purchase report
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- 4. Best-selling products by units
SELECT p.product_name, SUM(od.quantity) AS units_sold
FROM Product p
JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;

-- 5. Category-wise order detail sales
SELECT c.category_name,
       SUM(od.quantity * od.price) AS category_sales
FROM Category c
JOIN Product p ON c.category_id = p.category_id
JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY c.category_id, c.category_name
ORDER BY category_sales DESC;

-- 6. Subquery: products above the average price
SELECT product_name, price
FROM Product
WHERE price > (SELECT AVG(price) FROM Product);

-- 7. Window function: rank products by price (MySQL 8.0+)
SELECT product_name, price,
       RANK() OVER (ORDER BY price DESC) AS price_rank
FROM Product;

-- 8. View for order reporting
CREATE OR REPLACE VIEW Order_Report AS
SELECT c.customer_name, o.order_id, o.order_date,
       o.order_status, o.total_amount
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id;

SELECT * FROM Order_Report;

-- 9. Indexes for common searches
CREATE INDEX idx_capstone_orders_customer ON Orders(customer_id);
CREATE INDEX idx_capstone_product_category ON Product(category_id);

-- 10. Stored procedure to show a customer's order history
DELIMITER //

CREATE PROCEDURE GetCapstoneCustomerOrders(IN chosen_customer_id INT)
BEGIN
    SELECT order_id, order_date, order_status, total_amount
    FROM Orders
    WHERE customer_id = chosen_customer_id
    ORDER BY order_date DESC;
END //

DELIMITER ;

CALL GetCapstoneCustomerOrders(1);

-- 11. Trigger: reduce product stock when a new order detail is inserted.
-- Only insert a detail if there is enough stock. A production system would also
-- need transaction/error handling and validation around order placement.
DELIMITER //

CREATE TRIGGER ReduceStockAfterOrderDetail
AFTER INSERT ON Order_Details
FOR EACH ROW
BEGIN
    UPDATE Product
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id
      AND stock >= NEW.quantity;
END //

DELIMITER ;

-- Check product stock after any new Order_Details row is inserted.
SELECT product_id, product_name, stock FROM Product ORDER BY product_id;
