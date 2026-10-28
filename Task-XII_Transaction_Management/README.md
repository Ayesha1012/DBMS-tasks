# Task XII - Transaction Management System

## Aim
To understand how transactions keep related database changes consistent.

## Topics covered
- START TRANSACTION
- COMMIT
- ROLLBACK
- Updating stock during an order
- Basic ACID properties

## SQL file
Run `01_transactions.sql` in MySQL.

## Important note
The examples use ROLLBACK for practice, so the sample changes are undone. Run them on a practice database, not on important real data.

## Beginner note
A transaction groups SQL changes together. COMMIT saves the changes, while ROLLBACK cancels uncommitted changes.