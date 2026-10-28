# Example Business Insights

Use the reports in `02_capstone_reports.sql` to answer questions such as:

1. How many orders are in the sample data?
2. What is the total and average order value?
3. Which customers have the highest order totals?
4. Which products have sold the most units?
5. Which categories have the highest item sales?
6. Which products cost more than the average product price?
7. What is each customer's order history?
8. Which orders have pending payments?

## Important interpretation note
The sample data is fictional and is only for practising SQL. The total order value report sums the stored Orders.total_amount values. The category report calculates sales from Order_Details quantity multiplied by price, so the two reports may differ if sample order totals and line items do not match exactly.
