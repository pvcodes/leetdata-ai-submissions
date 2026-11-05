-- Customer Order Summary (Medium) · SQL
-- https://leetdata.ai/problems/customer-order-summary
-- Accepted on leetdata.ai · 2026-08-04

-- The 'customers' and 'orders' tables are pre-loaded.

SELECT
  c.name,
  c.city,
  count(o.customer_id) AS total_orders,
  ifnull(sum(o.amount), 0) AS total_amount,
  ifnull(avg(o.amount), 0) AS avg_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_amount DESC, c.name;
