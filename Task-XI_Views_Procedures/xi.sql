USE ecommerce_db;

-- 1. Create a view for customer order history
CREATE OR REPLACE VIEW Customer_Order_History AS
SELECT Customer.customer_id, Customer.customer_name,
       Orders.order_id, Orders.order_date, Orders.total_amount
FROM Customer
JOIN Orders ON Customer.customer_id = Orders.customer_id;

-- Test the view
SELECT * FROM Customer_Order_History;

-- 2. Create a view for product stock
CREATE OR REPLACE VIEW Product_Stock_Report AS
SELECT product_id, product_name, stock
FROM Product;

-- Test the view
SELECT * FROM Product_Stock_Report;

-- 3. Create a stored procedure to display one customer's orders
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN selected_customer_id INT)
BEGIN
    SELECT order_id, order_date, total_amount
    FROM Orders
    WHERE customer_id = selected_customer_id
    ORDER BY order_date;
END //

DELIMITER ;

-- Call the procedure with customer ID 1
CALL GetCustomerOrders(1);

-- 4. Create a function that returns total sales
DELIMITER //

CREATE FUNCTION GetTotalSales()
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE sales_total DECIMAL(10,2);

    SELECT COALESCE(SUM(total_amount), 0)
    INTO sales_total
    FROM Orders;

    RETURN sales_total;
END //

DELIMITER ;

-- Test the function
SELECT GetTotalSales() AS total_sales;
