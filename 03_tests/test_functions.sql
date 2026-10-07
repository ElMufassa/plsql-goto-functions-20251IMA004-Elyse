-- Tests for B1-B4 (run after compiling all functions in 02_functions/)
SET SERVEROUTPUT ON
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- B1 fn_annual_salary ---');
  DBMS_OUTPUT.PUT_LINE('101 (expect 10250000): ' || fn_annual_salary(101));
  DBMS_OUTPUT.PUT_LINE('109 (NULL salary, expect NULL): ' || NVL(TO_CHAR(fn_annual_salary(109)), 'NULL'));
  DBMS_OUTPUT.PUT_LINE('999 (not found, expect NULL): ' || NVL(TO_CHAR(fn_annual_salary(999)), 'NULL'));

  DBMS_OUTPUT.PUT_LINE('--- B2 fn_years_of_service ---');
  DBMS_OUTPUT.PUT_LINE('105: ' || fn_years_of_service(105));
  DBMS_OUTPUT.PUT_LINE('999 (expect NULL): ' || NVL(TO_CHAR(fn_years_of_service(999)), 'NULL'));

  DBMS_OUTPUT.PUT_LINE('--- B3 fn_calculate_tax ---');
  DBMS_OUTPUT.PUT_LINE('50000  (expect 0): '      || fn_calculate_tax(50000));
  DBMS_OUTPUT.PUT_LINE('90000  (expect 3000): '   || fn_calculate_tax(90000));
  DBMS_OUTPUT.PUT_LINE('150000 (expect 14000): '  || fn_calculate_tax(150000));
  DBMS_OUTPUT.PUT_LINE('850000 (expect 219000): ' || fn_calculate_tax(850000));
  BEGIN
    DBMS_OUTPUT.PUT_LINE(fn_calculate_tax(-1));
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('-1 (expect error): ' || SQLERRM);
  END;

  DBMS_OUTPUT.PUT_LINE('--- B4 fn_dept_name ---');
  DBMS_OUTPUT.PUT_LINE('101 (IT): '                 || fn_dept_name(101));
  DBMS_OUTPUT.PUT_LINE('108 (Unassigned): '         || fn_dept_name(108));
  DBMS_OUTPUT.PUT_LINE('999 (Employee not found): ' || fn_dept_name(999));
END;
/
