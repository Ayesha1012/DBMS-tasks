USE ecommerce_db;

CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    review_text VARCHAR(255),
    review_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Rating (
    rating_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Review VALUES
(1, 1, 101, 'Good product and easy to use.', '2026-09-03'),
(2, 2, 103, 'Nice quality.', '2026-09-04'),
(3, 1, 103, 'Good value for money.', '2026-09-06');

INSERT INTO Rating VALUES
(1, 1, 101, 5),
(2, 2, 103, 4),
(3, 1, 103, 5);

SELECT Product.product_name, Customer.customer_name,
       Review.review_text, Review.review_date
FROM Review
JOIN Product ON Review.product_id = Product.product_id
JOIN Customer ON Review.customer_id = Customer.customer_id;

SELECT Product.product_name, AVG(Rating.rating) AS average_rating
FROM Rating
JOIN Product ON Rating.product_id = Product.product_id
GROUP BY Product.product_id, Product.product_name;

SELECT Product.product_name, AVG(Rating.rating) AS average_rating
FROM Rating
JOIN Product ON Rating.product_id = Product.product_id
GROUP BY Product.product_id, Product.product_name
HAVING AVG(Rating.rating) >= 4;
