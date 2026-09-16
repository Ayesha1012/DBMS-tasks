# Task II - Product and Category Management

## Aim
To create Category and Product tables and perform basic product operations.

## Tables
### Category
Stores product categories.

### Product
Stores product name, category, price and stock.

## Relationship
One category can have many products.

`Category.category_id` is the primary key.

`Product.category_id` is a foreign key referring to Category.

## Operations included
- Insert products
- Update a product
- Delete a product
- Display products category-wise

## SQL file
Run `01_product_category.sql` after Task I.
