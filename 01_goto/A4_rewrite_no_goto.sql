-- A4 - Rewrite A1 and A2 WITHOUT GOTO (structured IF/ELSIF, CASE, CONTINUE)
SET SERVEROUTPUT ON

-- A1 rewritten
DECLARE
  v_result VARCHAR2(30);
BEGIN
  FOR rec IN (SELECT column_value AS n FROM TABLE(sys.odcinumberlist(-5, 0, 4, 7))) LOOP
    IF rec.n < 0 THEN v_result := 'Negative';
    ELSIF rec.n = 0 THEN v_result := 'Zero';
    ELSIF MOD(rec.n, 2) = 0 THEN v_result := 'Positive Even';
    ELSE v_result := 'Positive Odd';
    END IF;
    DBMS_OUTPUT.PUT_LINE(RPAD(rec.n, 4) || ' -> ' || v_result);
  END LOOP;
END;
/

-- A2 rewritten
DECLARE
  v_raise_pct NUMBER;
BEGIN
  FOR r IN (SELECT emp_id, first_name, monthly_salary FROM employees ORDER BY emp_id) LOOP
    IF r.monthly_salary IS NULL OR r.monthly_salary <= 0 THEN
      DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || RPAD(r.first_name, 8) || ' SKIPPED (missing or invalid salary)');
      CONTINUE;
    END IF;
    v_raise_pct := CASE WHEN r.monthly_salary < 100000 THEN 10
                        WHEN r.monthly_salary < 500000 THEN 5
                        ELSE 0 END;
    DBMS_OUTPUT.PUT_LINE(r.emp_id || ' ' || RPAD(r.first_name, 8) ||
      ' current=' || r.monthly_salary || ' raise=' || v_raise_pct ||
      '% new=' || r.monthly_salary * (1 + v_raise_pct / 100));
  END LOOP;
END;
/
