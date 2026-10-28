USE ecommerce_db;

-- 1. Rank products by price
SELECT product_name, price,
       RANK() OVER (ORDER BY price DESC) AS price_rank
FROM Product;

-- 2. Give each order a row number, newest order first
SELECT order_id, customer_id, order_date, total_amount,
       ROW_NUMBER() OVER (ORDER BY order_date DESC, order_id DESC) AS row_num
FROM Orders;

-- 3. Calculate each customer's total spending
SELECT Customer.customer_id, Customer.customer_name,
       COALESCE(SUM(Orders.total_amount), 0) AS total_spent
FROM Customer
LEFT JOIN Orders ON Customer.customer_id = Orders.customer_id
GROUP BY Customer.customer_id, Customer.customer_name
ORDER BY total_spent DESC;

-- 4. Simple customer segmentation based on total spending
SELECT customer_id, customer_name, total_spent,
       CASE
           WHEN total_spent >= 1000 THEN 'High Spending'
           WHEN total_spent > 0 THEN 'Some Spending'
           ELSE 'No Orders'
       END AS customer_segment
FROM (
    SELECT Customer.customer_id, Customer.customer_name,
           COALESCE(SUM(Orders.total_amount), 0) AS total_spent
    FROM Customer
    LEFT JOIN Orders ON Customer.customer_id = Orders.customer_id
    GROUP BY Customer.customer_id, Customer.customer_name
) AS customer_totals;

-- 5. Prepare simple product features for analysis
SELECT Product.product_id,
       Product.price AS price_feature,
       Product.stock AS stock_feature,
       COALESCE(AVG(Rating.rating), 0) AS average_rating_feature
FROM Product
LEFT JOIN Rating ON Product.product_id = Rating.product_id
GROUP BY Product.product_id, Product.price, Product.stock;

-- 6. Category-level analytical report
SELECT Category.category_name,
       COUNT(Product.product_id) AS product_count,
       COALESCE(AVG(Product.price), 0) AS average_price,
       COALESCE(SUM(Product.stock), 0) AS total_stock
FROM Category
LEFT JOIN Product ON Category.category_id = Product.category_id
GROUP BY Category.category_id, Category.category_name
ORDER BY product_count DESC;
