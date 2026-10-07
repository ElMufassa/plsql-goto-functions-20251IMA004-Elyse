-- B2 - Years of service (1 decimal). NULL if employee not found.
CREATE OR REPLACE FUNCTION fn_years_of_service (p_emp_id IN employees.emp_id%TYPE)
RETURN NUMBER
IS
  v_hire employees.hire_date%TYPE;
BEGIN
  SELECT hire_date INTO v_hire FROM employees WHERE emp_id = p_emp_id;
  RETURN GREATEST(0, ROUND(MONTHS_BETWEEN(SYSDATE, v_hire) / 12, 1));
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN NULL;
END fn_years_of_service;
/
SHOW ERRORS
