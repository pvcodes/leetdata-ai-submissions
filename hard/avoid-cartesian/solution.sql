-- Avoid Cartesian Product (Hard) · SQL
-- https://leetdata.ai/problems/avoid-cartesian
-- Accepted on leetdata.ai · 2026-08-13

-- IMPORTANT: Use a proper equi-join, NOT a cross join.
-- A cross join (FROM employees, departments) would give wrong results.

SELECT
  d.dept_id,
  d.dept_name,
  d.budget,
  count(e.emp_id) headcount,
  sum(e.salary) total_salary,
  round(avg(e.salary), 2) avg_salary,
  budget - sum(e.salary) budget_remaining
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name, d.budget
ORDER BY d.dept_name;
