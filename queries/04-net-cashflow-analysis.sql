-- Net Cash Flow Analysis
-- Business Question: How is the weekly cash flow pattern — are customers consistently in net inflow or net outflow, and which weeks have the healthiest cash flow ratio?
-- Dataset: ANZ Synthesised Transaction Dataset
-- Note: Credit = money in (e.g., salary, deposits), Debit = money out (e.g., purchases, payments)

-- Overview: total credit vs debit across all transactions
SELECT
  movement,
  COUNT(*) AS total_transactions,
  ROUND(SUM(amount), 2) AS total_amount
FROM `lateral-berm-398105.anz_transactions.anz`
GROUP BY movement

-- Weekly net cash flow (chronological)
SELECT
  EXTRACT(ISOWEEK FROM date) AS week,
  ROUND(SUM(CASE WHEN movement = 'credit' THEN amount ELSE 0 END), 2) AS total_credit,
  ROUND(SUM(CASE WHEN movement = 'debit' THEN amount ELSE 0 END), 2) AS total_debit,
  ROUND(
    SUM(CASE WHEN movement = 'credit' THEN amount ELSE 0 END)
      - SUM(CASE WHEN movement = 'debit' THEN amount ELSE 0 END),
    2) AS net_cashflow
FROM `lateral-berm-398105.anz_transactions.anz`
GROUP BY week
ORDER BY week ASC

-- Weekly net cash flow with status and credit/debit ratio
WITH weekly_cashflow AS (
  SELECT
    EXTRACT(ISOWEEK FROM date) AS week,
    ROUND(SUM(CASE WHEN movement = 'credit' THEN amount ELSE 0 END), 2) AS total_credit,
    ROUND(SUM(CASE WHEN movement = 'debit' THEN amount ELSE 0 END), 2) AS total_debit,
    ROUND(
      SUM(CASE WHEN movement = 'credit' THEN amount ELSE 0 END)
        - SUM(CASE WHEN movement = 'debit' THEN amount ELSE 0 END),
      2) AS net_cashflow
  FROM `lateral-berm-398105.anz_transactions.anz`
  GROUP BY week
)
SELECT
  week,
  total_credit,
  total_debit,
  net_cashflow,
  CASE
    WHEN net_cashflow > 0 THEN 'Net Inflow'
    ELSE 'Net Outflow'
  END AS cashflow_status,
  ROUND(total_credit / total_debit, 2) AS credit_debit_ratio
FROM weekly_cashflow
ORDER BY week ASC
