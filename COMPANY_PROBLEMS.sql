1. Write a query to find employees joined before their Managers.

INPUT:

CREATE TABLE COMPANY (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    join_date DATE
);

INSERT INTO COMPANY VALUES (1, 'Alice', NULL, TO_DATE('15-01-2018','DD-MM-YYYY'));
INSERT INTO COMPANY VALUES (2, 'Bob', 1, TO_DATE('10-03-2019','DD-MM-YYYY'));
INSERT INTO COMPANY VALUES (3, 'Charlie', 1, TO_DATE('21-06-2020','DD-MM-YYYY'));
INSERT INTO COMPANY VALUES (4, 'David', 2, TO_DATE('12-02-2021','DD-MM-YYYY'));
INSERT INTO COMPANY VALUES (5, 'Eva', 2, TO_DATE('30-07-2021','DD-MM-YYYY'));
INSERT INTO COMPANY VALUES (6, 'Frank', 3, TO_DATE('18-04-2022','DD-MM-YYYY'));
INSERT INTO COMPANY VALUES (7, 'Grace', 3, TO_DATE('05-09-2022','DD-MM-YYYY'));
INSERT INTO COMPANY VALUES (8, 'Hannah', 4, TO_DATE('11-01-2023','DD-MM-YYYY'));
INSERT INTO COMPANY VALUES (9, 'Ian', 4, TO_DATE('22-05-2023','DD-MM-YYYY'));
INSERT INTO COMPANY VALUES (10, 'Jack', 5, TO_DATE('14-03-2024','DD-MM-YYYY'));

COMMIT;

EMP_ID EMP_NAME        MANAGER_ID JOIN_DATE
------ --------------- ---------- ---------
     1 Alice                      15-JAN-18
     2 Bob                      1 10-MAR-19
     3 Charlie                  1 21-JUN-20
     4 David                    2 12-FEB-21
     5 Eva                      2 30-JUL-21
     6 Frank                    3 18-APR-22
     7 Grace                    3 05-SEP-22
     8 Hannah                   4 11-JAN-23
     9 Ian                      4 22-MAY-23
    10 Jack                     5 14-MAR-24
	
o/p:
No records should be selected

1. Write a query to find employees joined before their Managers.

SELECT a.emp_name from (SELECT e.emp_name from company e, company m where e.manager_id=m.emp_id
and e.JOIN_DATE<=m.JOIN_DATE)a	

SELECT x.emp_name
FROM (
    SELECT e.emp_name
    FROM company e, company m
    WHERE e.manager_id = m.emp_id
    AND e.join_date <= m.join_date
) x;

2..