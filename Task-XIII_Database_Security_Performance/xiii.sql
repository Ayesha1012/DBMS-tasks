USE ecommerce_db;

-- 1. Create a practice database user.
-- Change the placeholder password before running this on any real system.
CREATE USER IF NOT EXISTS 'ecommerce_reader'@'localhost'
IDENTIFIED BY 'ChangeThis_Password123!';

-- 2. Allow the user to read data from this database
GRANT SELECT ON ecommerce_db.* TO 'ecommerce_reader'@'localhost';

-- 3. Remove the read permission
-- Run this line only when you want to demonstrate REVOKE.
REVOKE SELECT ON ecommerce_db.* FROM 'ecommerce_reader'@'localhost';

-- 4. Create an index to help searches by product name
CREATE INDEX idx_product_name
ON Product(product_name);

-- 5. Create an index to help searches by order customer
CREATE INDEX idx_orders_customer_id
ON Orders(customer_id);

-- 6. Use EXPLAIN to see how MySQL plans a query
EXPLAIN
SELECT product_id, product_name, price
FROM Product
WHERE product_name = 'Keyboard';

-- 7. Check indexes on Product
SHOW INDEX FROM Product;

-- Security note:
-- Give users only the permissions they need.
-- Indexes can speed up searches, but they also take storage and can slow down inserts or updates.
