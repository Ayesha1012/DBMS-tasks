# Task XV - Industry Capstone Project: E-Commerce Intelligence Platform

## Aim
To combine the database modules built in Tasks I-XIV into one small e-commerce database project and use SQL to produce useful business reports.

## Modules included
- Customers
- Categories and products
- Sellers and inventory
- Orders and order details
- Payments
- Reviews and ratings
- Analytics and reporting

## Files
- `01_capstone_setup.sql` - creates the main tables and sample data
- `02_capstone_reports.sql` - demonstrates joins, aggregate queries, a view, a procedure, a trigger and indexes
- `ER_Diagram.md` - text-based ER relationship guide
- `SCHEMA_AND_NORMALIZATION.md` - short schema and normalization notes
- `BUSINESS_INSIGHTS.md` - example questions the reports can answer

## How to run
1. Use MySQL 8.0 or a compatible MySQL version.
2. Run `01_capstone_setup.sql` first.
3. Run `02_capstone_reports.sql` second.
4. Read the report comments and compare the results with the sample data.

The setup file creates a separate database called `ecommerce_capstone`, so it does not overwrite the earlier `ecommerce_db` task database.

## Important notes
- This is a learning capstone, not a production-ready store.
- The sample names, products and transactions are fictional.
- Stored procedures and triggers require a MySQL client that supports `DELIMITER`.
- Run the scripts on a practice database. The trigger reduces stock when an order detail is inserted, so do not insert the same sample order details repeatedly without resetting the database.
