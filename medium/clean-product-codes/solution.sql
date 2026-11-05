-- Clean Product Codes (Medium) · SQL
-- https://leetdata.ai/problems/clean-product-codes
-- Accepted on leetdata.ai · 2026-08-11

-- The 'products' table is pre-loaded.
-- Tip: split_part(string, '-', n) returns the n-th dash-separated field (1-indexed).

SELECT
  product_id,
  split_part(product_code, '-', 1) AS category_code,
  CAST(split_part(product_code, '-', 2) as INT) AS sku,
  split_part(product_code, '-', 3) AS size
FROM products
ORDER BY product_id;
