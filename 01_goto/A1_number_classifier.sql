-- A1 - Number Classifier (uses GOTO)
-- Classifies each test number as Negative, Zero, Even or Odd.
SET SERVEROUTPUT ON
DECLARE
  v_num    NUMBER;
  v_result VARCHAR2(30);
BEGIN
  FOR rec IN (SELECT column_value AS n FROM TABLE(sys.odcinumberlist(-5, 0, 4, 7))) LOOP
    v_num := rec.n;

    IF v_num < 0 THEN GOTO negative_number; END IF;
    IF v_num = 0 THEN GOTO zero_number;     END IF;
    IF MOD(v_num, 2) = 0 THEN GOTO even_number; END IF;
    GOTO odd_number;

    <<negative_number>>
    v_result := 'Negative';
    GOTO show_result;

    <<zero_number>>
    v_result := 'Zero';
    GOTO show_result;

    <<even_number>>
    v_result := 'Positive Even';
    GOTO show_result;

    <<odd_number>>
    v_result := 'Positive Odd';

    <<show_result>>
    DBMS_OUTPUT.PUT_LINE(RPAD(v_num, 4) || ' -> ' || v_result);
  END LOOP;
END;
/
