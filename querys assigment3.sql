#1 Write a query to display the name (FIRST_NAME, LAST_NAME) and SALARY for all employees whose salary is not in the range $10,000 through $15,000.

SELECT FIRST_NAME, LAST_NAME, SALARY 
from Employees
WHERE SALARY not BETWEEN 10000 AND 15000;

#2 Write a query to display the name (FIRST_NAME, LAST_NAME) and DEPARTMENT_ID of all employees in departments 30 or 100 in ascending order.

SELECT Employees.FIRST_NAME, 
Employees.LAST_NAME, 
Departments.DEPARTMENT_ID
  FROM Employees 
  INNER JOIN  Departments ON 
     Departments.DEPARTMENT_ID = Employees.DEPARTMENT_ID
ORDER BY DEPARTMENT_ID ASC;


#3 Write a query to display the name (FIRST_NAME, LAST_NAME) and SALARY for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.

select  first_name, last_name, salary, DEPARTMENT_ID
 from Employees
  WHERE salary NOT BETWEEN 10000 and 150000
  and DEPARTMENT_ID = 30 or DEPARTMENT_ID = 100;


#4 Write a query to display the name (FIRST_NAME, LAST_NAME) and HIRE_DATE for all employees who were hired in 1987.

SELECT FIRST_NAME, LAST_NAME,HIRE_DATE
  from Employees
   WHERE HIRE_DATE 
   LIKE  '1987%';

#5 Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
 Falta corregir el query 

SELECT FIRST_NAME
  from Employees
   WHERE FIRST_NAME 
   LIKE  '%b%' OR '%c%' ;

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
