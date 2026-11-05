-- Left Join Nulls (Medium) · SQL
-- https://leetdata.ai/problems/left-join-nulls
-- Accepted on leetdata.ai · 2026-11-05

-- The 'employees' and 'projects' tables are pre-loaded.

SELECT
  e.emp_id,
  e.name,
  e.department
FROM employees e
LEFT JOIN projects p ON e.emp_id = p.emp_id
WHERE p.project_id is null
ORDER BY e.emp_id;
