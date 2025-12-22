
-- 
SELECT * 
FROM Gold.fact_sales f
LEFT JOIN Gold.dim_customers c 
ON c.customer_key = f.customer_key
LEFT JOIN Gold.dim_product p 
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL 
