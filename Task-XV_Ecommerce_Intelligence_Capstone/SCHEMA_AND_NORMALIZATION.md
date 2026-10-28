# Schema and Normalization Notes

## Design
The project separates customers, products, categories, sellers, orders, order details, payments, reviews, ratings and inventory into different tables.

## Why separate tables?
- A customer can place many orders.
- An order can contain many products, so Order_Details stores each item separately.
- Product category information is stored once in Category.
- Payment records are linked to orders instead of repeating customer details.
- Reviews and ratings refer to customers and products using IDs.

## Normalization
- **First Normal Form (1NF):** Each column stores one value per row; product items are stored as separate Order_Details rows.
- **Second Normal Form (2NF):** Each table uses a primary key, and the non-key columns describe the row identified by that key.
- **Third Normal Form (3NF):** Category and customer details are kept in their own tables rather than repeated in product or order rows.

## Design note
This is a simplified academic schema. A real store would usually include additional constraints, stock reservation rules, refunds, delivery details, audit logs and stronger transaction handling.
