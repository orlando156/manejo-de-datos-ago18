--*Funciones*--
```1) Write a query to fetch even numbered records from employees table. 
SELECT * 
 FROM Employees 
	WHERE MOD(EMPLOYEE_ID,2) = 0  
   ORDER BY `Employees`.`EMPLOYEE_ID` ASC
2) Write a query to find the 5th maximum salary in the employees table.
 SELECT DISTINCT
FIRST_NAME,
  LAST_NAME,
  SALARY
  from Employees
  WHERE 5 = ( SELECT COUNT(DISTINCT SALARY) FROM Employees AS em2 
            WHERE em2.SALARY >= Employees.SALARY ); 
3) Write a query to find the 4th minimum salary in the employees table. 
 SELECT DISTINCT
FIRST_NAME,
  LAST_NAME,
  SALARY
  from Employees
  WHERE 3 = ( SELECT COUNT(DISTINCT SALARY) FROM Employees AS em2 
            WHERE em2.SALARY <= Employees.SALARY );

4) Write a query to select last 10 records from the employees table. 
SELECT   *
FROM
  Employees
ORDER BY
  Employees.EMPLOYEE_ID DESC
LIMIT 10 
5) Write a query to get the 3 maximum salaries. 
SELECT
   EMPLOYEE_ID,
   FIRST_NAME,
   LAST_NAME,
   salary
  FROM Employees
 GROUP BY EMPLOYEE_ID
ORDER BY SALARY DESC
LIMIT 3

6) Write a query to get the 3 minimum salaries.``` 
 SELECT
   EMPLOYEE_ID,
   FIRST_NAME,
   LAST_NAME,
   salary
FROM Employees
	GROUP BY EMPLOYEE_ID
ORDER BY SALARY ASC
LIMIT 3

-- subquerys-- 
1) Write a query to find the name (FIRST_NAME, LAST_NAME) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerks (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest.
SELECT
  FIRST_NAME,
  LAST_NAME,
  salary
FROM
  Employees
WHERE
  salary > (  SELECT MAX(salary)  FROM Employees  WHERE JOB_ID = 'SH_CLERK')
  ORDER BY SALARY DESC
2) Write a query to find the name (FIRST_NAME, LAST_NAME) of the employees who are not managers.
 select FIRST_Name, LAST_NAME, 
Employees.JOB_ID-- ,
-- Jobs.JOB_TITLE
FROM Employees
/*JOIN Jobs 
on Employees.JOB_ID = Jobs.JOB_ID*/
WHERE EMPLOYEE_ID NOT IN (SELECT Employees.MANAGER_ID FROM Employees) 

3) Write a query to display the employee ID, first name, last name, and department names of all employees.
SELECT Employees.EMPLOYEE_ID,
  Employees.FIRST_NAME,
  Employees.LAST_NAME,
  Departments.DEPARTMENT_NAME
FROM `Employees` 
 JOIN Departments
 ON Employees.DEPARTMENT_ID = Departments.DEPARTMENT_ID

4) Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
SELECT
   EMPLOYEE_ID,
   FIRST_NAME,
   LAST_NAME, 
   salary
	FROM Employees
	WHERE salary > (SELECT  AVG(salary) FROM Employees)  
ORDER BY `Employees`.`EMPLOYEE_ID` ASC

-- join queries*--
1) Write a query to get the department name and number of employees in the department.
SELECT DEPARTMENT_NAME,
Employees.DEPARTMENT_ID
FROM Departments 
INNER JOIN Employees 
ON Departments.DEPARTMENT_ID = Employees.DEPARTMENT_ID;

2) Write a query to find the employee ID, job title, number of days between ending date and 
starting date for all jobs in department 90 from job history.

SELECT Employees.EMPLOYEE_ID,
  Employees.DEPARTMENT_ID,
   Jobs.JOB_TITLE,
   JobHistory.END_DATE,
   JobHistory.START_DATE,
DATEDIFF( JobHistory.END_DATE,JobHistory.START_DATE ) as days /*esta función sirve para sacar los días la función DATEDIFF en MySQL, tienes que añadirle las dos fechas y te saca la cantidad de días entre las dos*/
FROM JobHistory 
INNER JOIN Jobs 
ON JobHistory.JOB_ID = Jobs.JOB_ID
INNER JOIN Employees
ON JobHistory.EMPLOYEE_ID = Employees.EMPLOYEE_ID  
WHERE Employees.DEPARTMENT_ID = 90
ORDER BY `Employees`.`EMPLOYEE_ID` ASC

3) Write a query to display the department ID and name and first name of manager.
SELECT Departments.DEPARTMENT_ID,
   Departments.DEPARTMENT_NAME,
   Employees.FIRST_NAME
FROM Departments
 	INNER JOIN Employees
 	ON Departments.DEPARTMENT_ID = Employees.DEPARTMENT_ID
WHERE Employees.DEPARTMENT_ID = '90';
4) Write a query to display the department name, manager name, and city.
 SELECT 
Departments.DEPARTMENT_NAME,
Employees.FIRST_NAME,
Locations.CITY
FROM Departments
INNER JOIN Employees
ON Departments.DEPARTMENT_ID = Employees.DEPARTMENT_ID
   INNER JOIN Locations
   ON Departments.Location_id = Locations.LOCATION_ID
-- WHERE Employees.DEPARTMENT_ID = '90';
5) Write a query to display the job title and average salary of employees.
  select
  Jobs.JOB_TITLE,
AVG(SALARY) AS average_salary
FROM  Jobs 
INNER JOIN Employees
ON Jobs.JOB_ID = Employees.JOB_ID
GROUP by EMPLOYEE_ID
6) Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
SELECT JOB_title,
 Employees.FIRST_NAME,
 Employees.LAST_NAME,
 COUNT (SALARY) as Salario_total ,
 salary,
 MIN(salary) as Salary_min
FROM Jobs 
INNER JOIN Employees
ON Jobs.JOB_ID = Employees.JOB_ID
GROUP BY Employees.FIRST_NAME

7) Escriba una consulta para mostrar el historial de trabajo que realizó cualquier empleado que actualmente está obteniendo más de 10000 de salario.

7) Write a query to display the job history that was done by any employee who is currently drawing more than 10000 of salary.
SELECT
 -- Employees.EMPLOYEE_ID,
  DATE_FORMAT(JobHistory.END_DATE,
  '%Y, %m,%d') - DATE_FORMAT( JobHistory.START_DATE,  '%Y %m %D' ) AS YEARS,
  DATEDIFF( JobHistory.END_DATE,  JobHistory.START_DATE ) AS Days,
  Employees.SALARY,
  Employees.FIRST_NAME,
  Employees.LAST_NAME
FROM
  Employees
LEFT JOIN
  JobHistory ON JobHistory.EMPLOYEE_ID = Employees.EMPLOYEE_ID
WHERE
  SALARY > 10000

8) Write a query to display department name, full name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.```
SELECT Employees.FIRST_NAME,
Employees.LAST_NAME,
   Employees.HIRE_DATE,
   YEAR(CURDATE())-YEAR(Employees.HIRE_DATE) + IF(DATE_FORMAT(CURDATE(),'%m-%d') > DATE_FORMAT(Employees.HIRE_DATE,'%m-%d'),0,1 ) AS antiguedad,
   Employees.SALARY,
   DATE_FORMAT(JobHistory.END_DATE,
  '%Y, %m,%d') - DATE_FORMAT( JobHistory.START_DATE,  '%Y %m %D' ) AS YEAR,
  DATEDIFF( JobHistory.END_DATE,  JobHistory.START_DATE ) AS Days,
    JobHistory.END_DATE,
   JobHistory.START_DATE
FROM Employees
INNER JOIN JobHistory
	ON Employees.DEPARTMENT_ID = 	JobHistory.DEPARTMENT_ID
