-- Age Group Analysis
-- Business Question: Which age group segment contributed the most to transaction volume and estimated fee revenue, assuming a 0.3% fee rate per transaction (based on common crypto exchange fee structures)?
-- Dataset: ANZ Synthesised Transaction Dataset
-- Note: Fee estimation is a simulation to contextualize the analysis within a trading platform context (e.g., Indodax)

-- Ranked by transaction amount

SELECT
  CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56-75'
    END AS age_group,
  COUNT(DISTINCT customer_id) AS total_customer_in_age_group,
  SUM(amount) as transaction_amount,
  SUM(amount) * 0.003 AS estimated_fee
FROM anz_transactions.anz
GROUP BY age_group
ORDER BY transaction_amount DESC
