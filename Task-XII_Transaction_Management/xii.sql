USE ecommerce_db;

-- Check current stock before the example
SELECT product_id, product_name, stock
FROM Product
WHERE product_id = 101;

-- 1. Start a transaction and reduce stock
START TRANSACTION;

UPDATE Product
SET stock = stock - 1
WHERE product_id = 101 AND stock > 0;

-- Check the change inside the transaction
SELECT product_id, product_name, stock
FROM Product
WHERE product_id = 101;

-- Undo this practice change
ROLLBACK;

-- Check that stock returned to its earlier value
SELECT product_id, product_name, stock
FROM Product
WHERE product_id = 101;

-- 2. Example of COMMIT
-- This is a demonstration. Roll it back instead if you do not want to keep the change.
START TRANSACTION;

UPDATE Product
SET stock = stock + 1
WHERE product_id = 101;

-- Save the change permanently
COMMIT;

-- 3. Check the final stock
SELECT product_id, product_name, stock
FROM Product
WHERE product_id = 101;

-- ACID properties:
-- Atomicity: all transaction steps succeed or are rolled back.
-- Consistency: database rules remain satisfied.
-- Isolation: concurrent transactions are kept from interfering improperly.
-- Durability: committed changes remain saved.
