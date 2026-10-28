# ER Diagram Guide - E-Commerce Intelligence Platform

Use this relationship guide when drawing the ER diagram in your report.

```text
Customer 1 -------- many Orders
Orders 1 ---------- many Order_Details
Product 1 --------- many Order_Details
Category 1 -------- many Product
Seller 1 ---------- many Product
Seller 1 ---------- many Inventory
Product 1 --------- many Inventory
Orders 1 ---------- many Payment
Customer 1 -------- many Review
Product 1 --------- many Review
Customer 1 -------- many Rating
Product 1 --------- many Rating
```

## Main keys
- Customer: `customer_id` (PK)
- Category: `category_id` (PK)
- Seller: `seller_id` (PK)
- Product: `product_id` (PK), `category_id` and `seller_id` (FKs)
- Orders: `order_id` (PK), `customer_id` (FK)
- Order_Details: `order_detail_id` (PK), `order_id` and `product_id` (FKs)
- Payment: `payment_id` (PK), `order_id` (FK)
- Review: `review_id` (PK), `customer_id` and `product_id` (FKs)
- Rating: `rating_id` (PK), `customer_id` and `product_id` (FKs)
- Inventory: `inventory_id` (PK), `seller_id` and `product_id` (FKs)
