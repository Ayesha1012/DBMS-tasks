USE ecommerce_db;

-- 1. Find products that cost more than the average product price
SELECT product_name, price
FROM Product
WHERE price > (
    SELECT AVG(price)
    FROM Product
);

-- 2. Find the customer or customers with the highest total purchase amount
SELECT Customer.customer_name,
       SUM(Orders.total_amount) AS purchase_amount
FROM Customer
JOIN Orders ON Customer.customer_id = Orders.customer_id
GROUP BY Customer.customer_id, Customer.customer_name
HAVING SUM(Orders.total_amount) = (
    SELECT MAX(customer_total)
    FROM (
        SELECT SUM(total_amount) AS customer_total
        FROM Orders
        GROUP BY customer_id
    ) AS customer_amounts
);

-- 3. Find customers who have placed at least one order
SELECT customer_name
FROM Customer
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
);

-- 4. Find products that have never been ordered
SELECT product_name
FROM Product
WHERE product_id NOT IN (
    SELECT product_id
    FROM Order_Details
);

-- 5. Find orders above the average order amount
SELECT order_id, customer_id, total_amount
FROM Orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Orders
);

-- 6. Find products that cost more than the cheapest product
SELECT product_name, price
FROM Product
WHERE price > (
    SELECT MIN(price)
    FROM Product
)
ORDER BY price DESC;
