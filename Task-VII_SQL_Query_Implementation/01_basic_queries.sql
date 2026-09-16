USE ecommerce_db;

-- 1. SELECT
SELECT * FROM Product;

-- 2. WHERE
SELECT * FROM Product
WHERE price > 500;

-- 3. ORDER BY
SELECT * FROM Product
ORDER BY price DESC;

-- 4. DISTINCT
SELECT DISTINCT category_id
FROM Product;

-- 5. Search products by price
SELECT product_name, price
FROM Product
WHERE price BETWEEN 400 AND 1000;

-- 6. Search products by category
SELECT product_name, price
FROM Product
WHERE category_id = 1;

-- 7. Search available products
SELECT product_name, stock
FROM Product
WHERE stock > 0;

-- 8. Customer information
SELECT customer_id, customer_name, email
FROM Customer;

-- 9. Product information
SELECT product_name, price, stock
FROM Product;

-- 10. Products with low stock
SELECT product_name, stock
FROM Product
WHERE stock < 20;

-- 11. Products from highest to lowest price
SELECT product_name, price
FROM Product
ORDER BY price DESC;

-- 12. Count products
SELECT COUNT(*) AS total_products
FROM Product;

-- 13. Basic category report
SELECT Category.category_name, COUNT(Product.product_id) AS number_of_products
FROM Category
LEFT JOIN Product ON Category.category_id = Product.category_id
GROUP BY Category.category_id, Category.category_name;
