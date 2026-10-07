# PL/SQL GOTO Statements and Functions

**Course:** Database Development with PL/SQL (INSY 8311)
**Assignment:** Individual Assignment III
**Student:** Elyse (20251IMA004)

## Overview
Oracle PL/SQL work covering GOTO statements, stored functions, exception handling, and functions used in SQL.

## Tasks
| Task | Description | File |
|---|---|---|
| A1 | Number Classifier (GOTO) | `01_goto/A1_number_classifier.sql` |
| A2 | Salary Review (GOTO) | `01_goto/A2_salary_review.sql` |
| A3 | Illegal GOTO and fix | `01_goto/A3_illegal_goto.sql` |
| A4 | Rewrite without GOTO | `01_goto/A4_rewrite_no_goto.sql` |
| B1 | Annual salary function | `02_functions/B1_fn_annual_salary.sql` |
| B2 | Years of service function | `02_functions/B2_fn_years_of_service.sql` |
| B3 | Tax calculator function | `02_functions/B3_fn_calculate_tax.sql` |
| B4 | Department name function | `02_functions/B4_fn_dept_name.sql` |
| B5 | Functions in SQL | `03_tests/B5_functions_in_select.sql` |
| C1 | Payroll validator | `02_functions/C1_fn_validate_payroll.sql` |
| C2 | Reflection | `docs/REFLECTION.md` |

## How to Run
1. Run `00_setup/create_tables.sql`.
2. Run the functions in `02_functions/`.
3. Run the programs in `01_goto/`.
4. Run the test files in `03_tests/`.
5. Verify results against `screenshots/`.

Use `SET SERVEROUTPUT ON` in SQL*Plus / SQL Developer to see `DBMS_OUTPUT`.

## Sample Data Notes
Employees 108-110 are intentionally invalid (no department, NULL salary, negative salary) to exercise validation and exception handling.

## Screenshots
`A1_output.png`, `A2_output.png`, `A3_error_and_fix.png`, `A4_output.png`, `B5_select_output.png`, `C1_output.png`
