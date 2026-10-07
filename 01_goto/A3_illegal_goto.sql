-- A3 - Illegal GOTO and Fix
SET SERVEROUTPUT ON

-- ===== BLOCK 1: ILLEGAL (run alone; capture screenshot A3_error_and_fix.png) =====
-- A GOTO cannot branch INTO an IF / LOOP / nested block.
-- Expected error: PLS-00375: illegal GOTO statement; this GOTO cannot branch to label 'INSIDE_IF'
BEGIN
  GOTO inside_if;
  IF 1 = 1 THEN
    <<inside_if>>
    DBMS_OUTPUT.PUT_LINE('Inside the IF block');
  END IF;
END;
/

-- ===== BLOCK 2: FIXED =====
-- Fix: place the label in the same (or an enclosing) block as the GOTO, never inside the IF.
-- GOTO may jump OUT of an IF/LOOP, or to a label at the same level, but not INTO one.
BEGIN
  GOTO after_if;
  DBMS_OUTPUT.PUT_LINE('This line is skipped');
  <<after_if>>
  DBMS_OUTPUT.PUT_LINE('Fixed: jumped to a label in the same block');
END;
/
