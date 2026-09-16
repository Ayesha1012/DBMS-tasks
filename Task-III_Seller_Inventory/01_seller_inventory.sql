USE ecommerce_db;

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    seller_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Seller VALUES
(1, 'Tech World', 'techworld@gmail.com'),
(2, 'Fashion Store', 'fashionstore@gmail.com'),
(3, 'Book House', 'bookhouse@gmail.com');

INSERT INTO Inventory VALUES
(1, 1, 101, 20),
(2, 1, 102, 0),
(3, 2, 103, 15);

SELECT * FROM Inventory;

SELECT Product.product_name, Seller.seller_name, Inventory.quantity
FROM Inventory
JOIN Product ON Inventory.product_id = Product.product_id
JOIN Seller ON Inventory.seller_id = Seller.seller_id
WHERE Inventory.quantity > 0;

SELECT Product.product_name, Seller.seller_name, Inventory.quantity
FROM Inventory
JOIN Product ON Inventory.product_id = Product.product_id
JOIN Seller ON Inventory.seller_id = Seller.seller_id
WHERE Inventory.quantity = 0;

SELECT Product.product_name, Seller.seller_name, Inventory.quantity,
       CASE
           WHEN Inventory.quantity > 0 THEN 'Available'
           ELSE 'Unavailable'
       END AS status
FROM Inventory
JOIN Product ON Inventory.product_id = Product.product_id
JOIN Seller ON Inventory.seller_id = Seller.seller_id;
