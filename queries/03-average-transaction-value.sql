-- Average Transaction Value per Customer
-- Business Question: What is the overall average transaction value per customer?
-- Dataset: ANZ Synthesised Transaction Dataset
-- Note: Uses CTE to first calculate per-customer averages before aggregating overall

WITH customer_summary AS (
  SELECT
    customer_id,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount,
    SUM(amount) / COUNT(*) AS avg_transaction
  FROM `anz_transactions.anz`
  GROUP BY customer_id
)

SELECT
  ROUND(AVG(avg_transaction), 2) AS overall_avg_transaction
FROM customer_summary
