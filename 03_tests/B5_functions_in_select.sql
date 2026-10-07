-- B5 - Using the functions inside SQL (SELECT, WHERE, ORDER BY)
SET LINESIZE 200 PAGESIZE 50

-- 1) In the SELECT list
SELECT emp_id, first_name,
       fn_dept_name(emp_id)        AS department,
       fn_annual_salary(emp_id)    AS annual_salary,
       fn_years_of_service(emp_id) AS years_service
FROM   employees
ORDER  BY emp_id;

-- 2) In WHERE and ORDER BY: employees with 5+ years of service and a valid annual salary, highest first
SELECT emp_id, first_name, fn_years_of_service(emp_id) AS years_service, fn_annual_salary(emp_id) AS annual_salary
FROM   employees
WHERE  fn_years_of_service(emp_id) >= 5
AND    fn_annual_salary(emp_id) > 0
ORDER  BY fn_annual_salary(emp_id) DESC;

-- 3) Tax on valid salaries only (B3 raises an error on negative salaries)
SELECT emp_id, first_name, monthly_salary, fn_calculate_tax(monthly_salary) AS monthly_tax
FROM   employees
WHERE  monthly_salary >= 0
ORDER  BY emp_id;
