-- A2 - Salary Review (uses GOTO)
-- Bands (monthly salary, RWF): < 100,000 => +10% | < 500,000 => +5% | otherwise no raise.
-- Employees with a missing/invalid salary are skipped with GOTO.
SET SERVEROUTPUT ON
DECLARE
  v_raise_pct NUMBER;
  v_new_sal   NUMBER;
BEGIN
  FOR r IN (SELECT emp_id, first_name, monthly_salary FROM employees ORDER BY emp_id) LOOP
    IF r.monthly_salary IS NULL OR r.monthly_salary <= 0 THEN GOTO skip_employee; END IF;
    IF r.monthly_salary < 100000 THEN GOTO low_band; END IF;
    IF r.monthly_salary < 500000 THEN GOTO mid_band; END IF;
    GOTO high_band;

    <<low_band>>
    v_raise_pct := 10;
    GOTO print_review;

    <<mid_band>>
    v_raise_pct := 5;
    GOTO print_review;

    <<high_band>>
    v_raise_pct := 0;

    <<print_review>>
    v_new_sal := r.monthly_salary * (1 + v_raise_pct / 100);
    DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || RPAD(r.first_name, 8) ||
      ' current=' || r.monthly_salary || ' raise=' || v_raise_pct || '% new=' || v_new_sal);
    GOTO next_employee;

    <<skip_employee>>
    DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || RPAD(r.first_name, 8) || ' SKIPPED (missing or invalid salary)');

    <<next_employee>>
    NULL;
  END LOOP;
END;
/
