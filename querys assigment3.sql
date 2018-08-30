#1 Write a query to display the name (FIRST_NAME, LAST_NAME) and SALARY for all employees whose salary is not in the range $10,000 through $15,000.

SELECT FIRST_NAME, LAST_NAME, SALARY 
from Employees
WHERE SALARY not BETWEEN 10000 AND 15000;

#2 Write a query to display the name (FIRST_NAME, LAST_NAME) and DEPARTMENT_ID of all employees in departments 30 or 100 in ascending order.

SELECT Employees.FIRST_NAME, 
Employees.LAST_NAME, 
Employees.DEPARTMENT_ID
  FROM Employees 
  where DEPARTMENT_ID = '30' or DEPARTMENT_ID = '100'
  ORDER BY DEPARTMENT_ID ASC


#3 Write a query to display the name (FIRST_NAME, LAST_NAME) and SALARY for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.

select  first_name, last_name, salary, DEPARTMENT_ID
 from Employees
  WHERE salary NOT BETWEEN 10000 and 150000
  and DEPARTMENT_ID = 30 or DEPARTMENT_ID = 100;


#4 Write a query to display the name (FIRST_NAME, LAST_NAME) and HIRE_DATE for all employees who were hired in 1987.

SELECT FIRST_NAME, LAST_NAME,HIRE_DATE
  from Employees
   WHERE HIRE_DATE 
   LIKE  '1987_%';

#5 Write a query to display the first_name of all employees who have both "b" and "c" in their first name. 

SELECT FIRST_NAME
  from Employees
   WHERE FIRST_NAME 
   LIKE  '%b__c%';
#6 Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer (IT_PROG) or a Shipping Clerk (SH_CLERK), and whose salary is not equal to $4,500, $10,000 or $15,000.

SELECT last_name,
 job_id,
 salary
FROM Employees  
WHERE job_id = 'IT_PROG' OR  JOB_ID ='SH_CLERK'
AND salary NOT IN (4500 OR 10000 or 15000)

#7 Write a query to display the last name of employees whose first names have exactly 6 characters.
SELECT last_name
  FROM Employees 
   WHERE CHARACTER_LENGTH (first_name) = 6;
   
#8 Write a query to display the last name of employees having 'e' as the third character.
SELECT last_name  
 from Employees  
   WHERE last_name LIKE '__e%';
#9 Write a query to display the available JOBS (i.e. the ones that no employee has taken).
SELECT
 Employees.FIRST_NAME,
 Employees.LAST_NAME,
 Employees.EMPLOYEE_ID,
 Employees.JOB_ID,
  Jobs.JOB_ID,
  Jobs.JOB_TITLE,
 Employees.DEPARTMENT_ID
FROM Jobs
  LEFT Join Employees
  on  (Jobs.JOB_ID = Employees.JOB_ID)  
  WHERE Employees.EMPLOYEE_ID IS null
ORDER BY `Jobs`.`JOB_ID` ASC 
 #10 Write a query to display the name (FIRST_NAME, LAST_NAME), SALARY and PF (15% of salary) of all employees.
SELECT FIRST_NAME,
 LAST_NAME,
 SALARY, salary * 0.15 as pf
from Employees;

#11 Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
SELECT *
FROM `Employees` 
 WHERE LAST_NAME = 'BLAKE' 
  or LAST_NAME = 'SCOTT' or LAST_NAME = 'KING' or LAST_NAME ='FORD'
