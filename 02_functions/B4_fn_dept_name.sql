-- B4 - Department name for an employee.
CREATE OR REPLACE FUNCTION fn_dept_name (p_emp_id IN employees.emp_id%TYPE)
RETURN VARCHAR2
IS
  v_name departments.dept_name%TYPE;
BEGIN
  SELECT d.dept_name INTO v_name
  FROM   employees e LEFT JOIN departments d ON d.dept_id = e.dept_id
  WHERE  e.emp_id = p_emp_id;

  RETURN NVL(v_name, 'Unassigned');
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN 'Employee not found';
END fn_dept_name;
/
SHOW ERRORS
