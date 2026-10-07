-- C1 - Payroll Validator (combines GOTO + functions + exception handling)
-- Returns 'VALID' or 'INVALID: <reason>'. GOTO jumps OUT of IF blocks to a shared error exit.
CREATE OR REPLACE FUNCTION fn_validate_payroll (p_emp_id IN employees.emp_id%TYPE)
RETURN VARCHAR2
IS
  v_salary employees.monthly_salary%TYPE;
  v_dept   employees.dept_id%TYPE;
  v_hire   employees.hire_date%TYPE;
  v_msg    VARCHAR2(200);
BEGIN
  SELECT monthly_salary, dept_id, hire_date INTO v_salary, v_dept, v_hire
  FROM   employees WHERE emp_id = p_emp_id;

  IF v_salary IS NULL THEN v_msg := 'salary is missing';          GOTO invalid_payroll; END IF;
  IF v_salary <= 0    THEN v_msg := 'salary must be positive';    GOTO invalid_payroll; END IF;
  IF v_dept IS NULL   THEN v_msg := 'no department assigned';     GOTO invalid_payroll; END IF;
  IF v_hire > SYSDATE THEN v_msg := 'hire date is in the future'; GOTO invalid_payroll; END IF;

  RETURN 'VALID';

  <<invalid_payroll>>
  RETURN 'INVALID: ' || v_msg;
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN 'INVALID: employee not found';
END fn_validate_payroll;
/
SHOW ERRORS
