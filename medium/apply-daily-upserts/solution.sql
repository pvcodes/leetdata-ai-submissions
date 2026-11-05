-- Apply Daily Upserts (Medium) · SQL
-- https://leetdata.ai/problems/apply-daily-upserts
-- Accepted on leetdata.ai · 2026-08-11

-- Tables 'products_base' and 'product_updates' are pre-loaded.
-- Stack both tables, rank per product newest-first, keep rank 1.

WITH combined AS (
  SELECT * FROM products_base
  UNION ALL
  SELECT * FROM product_updates
),
ranked AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY updated_at DESC) AS rn
  FROM combined
)
SELECT product_id, name, price, updated_at
FROM ranked
WHERE rn = 1
ORDER BY product_id;
