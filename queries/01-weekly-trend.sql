-- Weekly Transaction Trend Analysis
-- Business Question: When did peak transactions occur per week, and what was the estimated fee revenue generated, assuming a 0.3% fee rate per transaction (based on common crypto exchange fee structures)?
-- Dataset: ANZ Synthesised Transaction Dataset
-- Note: Fee estimation is a simulation to contextualize the analysis within a trading platform context (e.g., Indodax)

-- Chronological view
SELECT
  EXTRACT(WEEK FROM date) AS week,
  COUNT(*) AS total_transactions,
  SUM(amount) AS total_amount,
  SUM(amount) * 0.003 AS estimated_fee
FROM `lateral-berm-398105.anz_transactions.anz`
GROUP BY week
ORDER BY week ASC

-- Ranked by peak transactions
SELECT
  EXTRACT(WEEK FROM date) AS week,
  COUNT(*) AS total_transactions,
  SUM(amount) AS total_amount,
  SUM(amount) * 0.003 AS estimated_fee
FROM `lateral-berm-398105.anz_transactions.anz`
GROUP BY week
ORDER BY total_transactions DESC

-- Ranked by estimated fee revenue
SELECT
  EXTRACT(WEEK FROM date) AS week,
  COUNT(*) AS total_transactions,
  SUM(amount) AS total_amount,
  SUM(amount) * 0.003 AS estimated_fee
FROM `lateral-berm-398105.anz_transactions.anz`
GROUP BY week
ORDER BY estimated_fee DESC
