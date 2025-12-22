/*
=============================================================================
Quality Checks
=============================================================================
Script purpose :
  This script performs quality checks to validate the integrity, consistency, 
  and accuracy of the Gold layer. These checks ensure : 
  - Uniqueness of surrogate keys in dimension tables.
  - Referential integrity between fact and dimension tables.
  - Validation of relationships in the data model for analytical purposes.

Usage Notes : 
  - Run these checks after data loading silver layer.
  - Investigate and resolve any discrepancies found during the checks.
=============================================================================
*/

-- ======================================================
-- Checking 'Gold.dim_customers'
-- ====================================================== 
-- Check for uniquesness of Customers key in Gold.dim_customers 
-- Expectation : No results
SELECT
customers_key,
COUNT(*) AS duplicate_count
FROM Gold.dim_customers
GROUP BY customers_key
HAVING COUNT(*) > 1

-- ======================================================
-- Checking 'Gold.dim_product'
-- ====================================================== 
SELECT
product_key,
COUNT(*) AS duplicate_count
FROM Gold.dim_product
GROUP BY product_key
HAVING COUNT(*) > 1

-- ======================================================
-- Checking 'Gold.fact_sales'
-- ====================================================== 
SELECT * 
FROM Gold.fact_sales f
LEFT JOIN Gold.dim_customers c 
ON c.customer_key = f.customer_key
LEFT JOIN Gold.dim_product p 
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL 
