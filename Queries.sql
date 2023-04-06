
USE HOSPITAL_FINAL_PROJECT;

--Selecting specific treatements a patient is receiving
--SELECT * FROM TREATMENT WHERE PATIENT_ID = 123456789;

--Average salary of doctors
/*
SELECT AVG(SALARY)
FROM EMPLOYEE
WHERE EMPLOYEE_TYPE_ID = (SELECT EMPLOYEE_TYPE_ID FROM EMPLOYEE_TYPE WHERE EMPLOYEE_ROLE = 'Doctor');
*/

--Finding the total number of treatments performed by Dr. Andrew Green in the South West location
/*
SELECT COUNT(*) AS NUM_TREATMENTS
FROM TREATMENT
WHERE PRIMARY_DOCTOR = 5 AND TREATMENT_LOCATION = 2;
*/

--Average cost for a specific treatment

--SELECT AVG(COST) FROM TREATMENT WHERE ILLNESS_ID = 2;


--Find the number of Nurses who work at the South West location


--SELECT COUNT(DISTINCT EMPLOYEE_ID) FROM EMPLOYEE WHERE EMPLOYEE_TYPE_ID = 1 AND WORKS_AT = 2;


--This finds the first name and last name of all employees who live in windosr

/*
SELECT e.FNAME, e.LNAME, a.CITY

FROM EMPLOYEE e

JOIN ADDRESS a ON e.ADDRESS_ID = a.ADDRESS_ID

WHERE a.CITY = 'Windsor' AND e.EMPLOYEE_TYPE_ID = 2;

*/

--This finds the average salary of employees based on specialization

/*
SELECT S.SPECIALIZATION, AVG(E.SALARY) AS AVERAGE_SALARY

FROM EMPLOYEE AS E

JOIN SPECIALIZATION AS S ON E.SPECIALIZATION_ID = S.SPECIALIZATION_ID

GROUP BY S.SPECIALIZATION

ORDER BY AVERAGE_SALARY DESC;
*/