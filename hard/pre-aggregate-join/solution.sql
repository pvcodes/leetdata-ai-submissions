-- Pre-Aggregate Before Join (Hard) · SQL
-- https://leetdata.ai/problems/pre-aggregate-join
-- Accepted on leetdata.ai · 2026-11-09

-- Aggregate line_items FIRST, then join with products.

WITH product_totals AS (
  SELECT
    product_id,
    sum(quantity * price) total_revenue,
    sum(quantity) total_units,
    count(distinct order_id) order_count
  FROM line_items
  GROUP BY product_id
)
SELECT
  p.product_id, product_name, category, total_revenue, total_units, order_count
FROM product_totals pt
JOIN products p ON pt.product_id = p.product_id
ORDER BY total_revenue DESC;
