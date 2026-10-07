-- Tests for C1 fn_validate_payroll
SET LINESIZE 200 PAGESIZE 50
SELECT emp_id, first_name, fn_validate_payroll(emp_id) AS payroll_status
FROM   employees
ORDER  BY emp_id;

-- Expected: 101-107 VALID | 108 no department | 109 salary missing | 110 salary must be positive
SELECT fn_validate_payroll(999) AS unknown_employee FROM dual;  -- INVALID: employee not found
