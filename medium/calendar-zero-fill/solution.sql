-- Calendar Zero-Fill (Medium) · SQL
-- https://leetdata.ai/problems/calendar-zero-fill
-- Accepted on leetdata.ai · 2026-08-11

-- The 'calendar' and 'orders' tables are pre-loaded.
-- Days with zero orders must appear with order_count = 0.

SELECT
  c.day,
  COUNT(o.order_id) AS order_count
FROM calendar c
LEFT JOIN orders o ON c.day = o.order_date
GROUP BY c.day
ORDER BY c.day;
