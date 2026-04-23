# ANZ Transaction Case Study

## Description
This project is my first hands-on data analysis project, built to learn how to analyze customer transaction data using SQL and Google BigQuery. The dataset used is a synthesised transaction dataset from ANZ Bank, simulated to practice financial data analysis in the context of a trading platform (e.g., Indodax).

---

## Business Questions
1. When did peak transactions occur per week, and what was the estimated fee revenue generated, assuming a 0.3% fee rate per transaction (based on common crypto exchange fee structures)?
2. Which age group segment contributed the most to transaction volume and estimated fee revenue, assuming a 0.3% fee rate per transaction?
3. What is the overall average transaction value per customer?
4. How is the weekly cash flow pattern — are customers consistently in net inflow or net outflow, and which weeks have the healthiest cash flow ratio?

---

## Dataset
- **Source:** [ANZ Synthesised Transaction Dataset](https://www.kaggle.com/datasets/ashraf1997/anz-synthesised-transaction-dataset/data)
- **Size:** 12,043 rows
- **Period:** August – October 2018
- **Key columns:** `transaction_id`, `customer_id`, `date`, `amount`, `balance`, `movement`, `age`, `gender`, `txn_description`

---

## Tools Used
- Google BigQuery
- SQL (BigQuery dialect)
- Google Looker Studio

---

## Dashboard
[View Interactive Dashboard](https://datastudio.google.com/reporting/ce4ff4cb-3c87-414f-883b-654abc15cdce)

---

## Key Insights

**1. Weekly Transaction Trend**
Peak transactions occurred in week 41 of 2018 (early October), with a total transaction amount of AUD 197,109. A significant drop of ~54% was observed in week 43 (AUD 91,016), which warrants further investigation into potential external factors.

**2. Age Group Analysis**
The dataset is dominated by customers aged 18–25 (47% of total customers), contributing to the highest transaction volume and estimated fee revenue in that segment. Further analysis is needed to determine whether this reflects the actual customer composition or a dataset bias.

**3. Average Transaction Value per Customer**
The overall average transaction value per customer is AUD 228.87.

**4. Net Cash Flow Analysis**
Despite debit transactions being significantly higher in volume (AUD 11,160 vs AUD 883), total credit amount consistently dominated every week — indicating that credit transactions are driven by high-value salary/pay deposits. As a result, customers were in a net inflow position across all observed weeks. Week 43 had the highest credit/debit ratio, while week 40 had the lowest.

---

## File Structure
```
queries/
├── 01_weekly_trend.sql         — Weekly transaction trend & estimated fee
├── 02_age_group_analysis.sql   — Age group contribution to volume & fee
├── 03_avg_transaction.sql      — Average transaction value per customer
└── 04_net_cashflow.sql         — Weekly net cash flow & credit/debit ratio
```
---

## Notes
- Fee estimation (0.3%) is a simulation to contextualize this analysis within a trading platform context and does not reflect actual ANZ fee structures.
- This project is built for learning purposes as part of a data analyst portfolio.
