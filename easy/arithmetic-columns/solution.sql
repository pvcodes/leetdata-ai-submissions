-- Arithmetic Columns (Easy) · SQL
-- https://leetdata.ai/problems/arithmetic-columns
-- Accepted on leetdata.ai · 2026-08-11

-- The 'sales' table is pre-loaded.

SELECT
  product_name,
  revenue,
  cost,
  SUM( revenue - cost) AS profit,
  SUM(revenue - cost) / SUM(revenue) * 100 AS margin_pct
FROM sales
GROUP BY product_name, revenue, cost
