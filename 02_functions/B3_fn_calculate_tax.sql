-- B3 - Monthly PAYE-style tax on a monthly salary (illustrative brackets, RWF):
--   0 - 60,000        : 0%
--   60,001 - 100,000  : 10%
--   100,001 - 200,000 : 20%
--   above 200,000     : 30%
CREATE OR REPLACE FUNCTION fn_calculate_tax (p_monthly_salary IN NUMBER)
RETURN NUMBER
IS
  v_tax NUMBER := 0;
BEGIN
  IF p_monthly_salary IS NULL OR p_monthly_salary < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salary must be a non-negative number');
  END IF;

  IF p_monthly_salary > 200000 THEN
    v_tax := 4000 + 20000 + (p_monthly_salary - 200000) * 0.30;
  ELSIF p_monthly_salary > 100000 THEN
    v_tax := 4000 + (p_monthly_salary - 100000) * 0.20;
  ELSIF p_monthly_salary > 60000 THEN
    v_tax := (p_monthly_salary - 60000) * 0.10;
  END IF;
  RETURN v_tax;
END fn_calculate_tax;
/
SHOW ERRORS
