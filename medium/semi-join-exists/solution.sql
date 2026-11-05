-- Semi Join Exists (Medium) · SQL
-- https://leetdata.ai/problems/semi-join-exists
-- Accepted on leetdata.ai · 2026-08-11

-- The 'suppliers' and 'shipments' tables are pre-loaded.

SELECT
  s.supplier_id,
  s.supplier_name,
  s.country
FROM suppliers s
WHERE EXISTS (
  SELECT 1 FROM shipments sh WHERE sh.supplier_id = s.supplier_id
)
ORDER BY s.supplier_id;
