-- 00_setup/create_tables.sql
-- Creates DEPARTMENTS and EMPLOYEES with sample data (re-runnable).
SET SERVEROUTPUT ON

BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departments PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE departments (
  dept_id    NUMBER        PRIMARY KEY,
  dept_name  VARCHAR2(50)  NOT NULL
);

CREATE TABLE employees (
  emp_id          NUMBER         PRIMARY KEY,
  first_name      VARCHAR2(50)   NOT NULL,
  last_name       VARCHAR2(50)   NOT NULL,
  dept_id         NUMBER         REFERENCES departments(dept_id),
  hire_date       DATE           NOT NULL,
  monthly_salary  NUMBER(12,2),             -- RWF per month
  bonus           NUMBER(12,2)   DEFAULT 0  -- yearly bonus
);

INSERT INTO departments VALUES (10, 'IT');
INSERT INTO departments VALUES (20, 'Finance');
INSERT INTO departments VALUES (30, 'HR');
INSERT INTO departments VALUES (40, 'Sales');

INSERT INTO employees VALUES (101,'Alice','Uwase',      10,   DATE '2018-03-15',  850000, 50000);
INSERT INTO employees VALUES (102,'Jean','Mugisha',     20,   DATE '2020-07-01',  620000, 20000);
INSERT INTO employees VALUES (103,'Grace','Ingabire',   30,   DATE '2015-01-10',  450000, 0);
INSERT INTO employees VALUES (104,'Eric','Habimana',    10,   DATE '2022-09-12',  300000, 10000);
INSERT INTO employees VALUES (105,'Diane','Mukamana',   20,   DATE '2012-05-20', 1200000, 100000);
INSERT INTO employees VALUES (106,'Patrick','Niyonzima',40,   DATE '2023-02-01',   55000, 0);
INSERT INTO employees VALUES (107,'Sandra','Uwimana',   40,   DATE '2019-11-25',  150000, 5000);
INSERT INTO employees VALUES (108,'David','Nshuti',     NULL, DATE '2024-01-08',   90000, 0);    -- no department
INSERT INTO employees VALUES (109,'Aline','Kayitesi',   30,   DATE '2021-06-30',    NULL, 0);    -- missing salary
INSERT INTO employees VALUES (110,'Moses','Bizimana',   10,   DATE '2017-08-14',   -5000, 0);    -- invalid salary

COMMIT;

SELECT e.emp_id, e.first_name, e.last_name, d.dept_name, e.hire_date, e.monthly_salary, e.bonus
FROM   employees e LEFT JOIN departments d ON d.dept_id = e.dept_id
ORDER  BY e.emp_id;
