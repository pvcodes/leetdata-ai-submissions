-- Anti Join Pattern (Medium) · SQL
-- https://leetdata.ai/problems/anti-join-pattern
-- Accepted on leetdata.ai · 2026-08-11

-- The 'products' and 'order_items' tables are pre-loaded.

SELECT
  p.product_id,
  p.product_name,
  p.category
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL
ORDER BY p.product_id;
