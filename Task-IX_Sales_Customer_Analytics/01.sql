USE ecommerce_db;

-- 1. Count the number of orders
SELECT COUNT(*) AS total_orders
FROM Orders;

-- 2. Find the total sales amount
SELECT SUM(total_amount) AS total_sales
FROM Orders;

-- 3. Find the average order amount
SELECT AVG(total_amount) AS average_order_amount
FROM Orders;

-- 4. Find the smallest order amount
SELECT MIN(total_amount) AS smallest_order
FROM Orders;

-- 5. Find the largest order amount
SELECT MAX(total_amount) AS largest_order
FROM Orders;

-- 6. Find how much each customer has spent
SELECT Customer.customer_id, Customer.customer_name,
       SUM(Orders.total_amount) AS purchase_amount
FROM Customer
JOIN Orders ON Customer.customer_id = Orders.customer_id
GROUP BY Customer.customer_id, Customer.customer_name
ORDER BY purchase_amount DESC;

-- 7. Find the best-selling products by quantity
SELECT Product.product_name,
       SUM(Order_Details.quantity) AS units_sold
FROM Product
JOIN Order_Details ON Product.product_id = Order_Details.product_id
GROUP BY Product.product_id, Product.product_name
ORDER BY units_sold DESC;

-- 8. Category-wise sales report
SELECT Category.category_name,
       SUM(Order_Details.quantity * Order_Details.price) AS category_sales
FROM Category
JOIN Product ON Category.category_id = Product.category_id
JOIN Order_Details ON Product.product_id = Order_Details.product_id
GROUP BY Category.category_id, Category.category_name
ORDER BY category_sales DESC;
