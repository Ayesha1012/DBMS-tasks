USE ecommerce_db;

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

INSERT INTO Category VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO Product VALUES
(101, 'Wireless Mouse', 1, 599.00, 25),
(102, 'Keyboard', 1, 899.00, 15),
(103, 'T-Shirt', 2, 499.00, 30),
(104, 'Notebook', 3, 199.00, 40);

SELECT * FROM Product;

UPDATE Product
SET price = 549.00
WHERE product_id = 103;

DELETE FROM Product
WHERE product_id = 104;

SELECT Category.category_name, Product.product_name, Product.price, Product.stock
FROM Category
JOIN Product ON Category.category_id = Product.category_id
ORDER BY Category.category_name;
