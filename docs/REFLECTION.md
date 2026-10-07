# Reflection - PL/SQL GOTO Statements and Functions

## 1. What I learned about GOTO
GOTO transfers control to a label (`<<label>>`) that must be followed by an executable statement (use `NULL;` if nothing else). It can jump forward or backward within the same block or to an enclosing block, and it can leave an IF or loop. It can never jump *into* an IF, loop, or nested block (PLS-00375, see A3).

## 2. GOTO vs structured code (A4)
My GOTO versions of A1 and A2 worked, but the control flow was harder to follow because I had to track several labels. The IF/ELSIF, CASE and CONTINUE versions are shorter and read top to bottom. I would use GOTO only for a shared error exit, as in C1.

## 3. Functions
A function must return a value on every path, so each one handles `NO_DATA_FOUND` explicitly. Because they are stored in the database, functions can be called directly from SQL (B5), which keeps business logic like tax and annual salary in one place.

## 4. Challenges
- Understanding why the illegal GOTO in A3 fails and how to restructure it.
- Handling bad data (NULL salary, negative salary, no department) in B1, B3, B4 and C1.
- Using a function that can raise an error (B3) inside a SELECT, which needs a WHERE filter.

## 5. What I would improve
Move tax brackets into a table instead of hard-coding them, and use a package to group the payroll functions.

