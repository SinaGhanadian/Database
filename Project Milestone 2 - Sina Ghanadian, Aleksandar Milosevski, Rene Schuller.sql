/*
Project Milestone 2
Created by: Sina Ghanadian, Rene Schuller, Aleksandar Milosevski
Submitted on: 2023-03-13
*/

--Database Definition

CREATE DATABASE HOSP;

--Using Hospital_Project Database

USE HOSP;

--Creating Tables

CREATE TABLE ADDRESS
(ADDRESS_ID INT NOT NULL,
HOUSENUMBER INT NOT NULL,
STREETNAME VARCHAR(100) NOT NULL,
POSTALCODE VARCHAR(15) NOT NULL,
CITY VARCHAR(15) NOT NULL,
PROVINCE VARCHAR(15) NOT NULL,
PRIMARY KEY (ADDRESS_ID));

CREATE TABLE CONTACT
(CONTACT_ID INT NOT NULL,
PHONE_NUMBER BIGINT NOT NULL,
EMAIL_ADDRESS VARCHAR(100) NOT NULL,
PRIMARY KEY (CONTACT_ID));

CREATE TABLE LOCATION_DETAILS
(LOCATION_ID INT NOT NULL,
LOCATION_NAME VARCHAR(100) NOT NULL,
ADDRESS_ID INT NOT NULL,
CONTACT_ID INT NOT NULL,
PRIMARY KEY (LOCATION_ID),
FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID),
FOREIGN KEY (CONTACT_ID) REFERENCES CONTACT(CONTACT_ID));

CREATE TABLE EMPLOYEE_TYPE
(EMPLOYEE_TYPE_ID BIGINT NOT NULL,
EMPLOYEE_ROLE VARCHAR(15) NOT NULL,
PRIMARY KEY (EMPLOYEE_TYPE_ID));

CREATE TABLE SPECIALIZATION
(SPECIALIZATION_ID INT NOT NULL,
SPECIALIZATION VARCHAR(100) NOT NULL,
EMPLOYEE_TYPE_ID BIGINT NOT NULL,
PRIMARY KEY (SPECIALIZATION_ID),
FOREIGN KEY (EMPLOYEE_TYPE_ID) REFERENCES EMPLOYEE_TYPE(EMPLOYEE_TYPE_ID));

CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT NOT NULL,
FNAME VARCHAR(15) NOT NULL,
LNAME VARCHAR(15) NOT NULL,
SALARY DECIMAL(10,2) NOT NULL,
HOURS DECIMAL(10,2) NOT NULL,
NUMPATIENT INT NOT NULL,
CONTACT_ID INT NOT NULL,
ADDRESS_ID INT NOT NULL,
EMPLOYEE_TYPE_ID BIGINT NOT NULL,
SPECIALIZATION_ID INT NOT NULL,
WORKS_AT INT NOT NULL,
PRIMARY KEY (EMPLOYEE_ID),
FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID),
FOREIGN KEY (EMPLOYEE_TYPE_ID) REFERENCES EMPLOYEE_TYPE(EMPLOYEE_TYPE_ID),
FOREIGN KEY (CONTACT_ID) REFERENCES CONTACT(CONTACT_ID),
FOREIGN KEY (SPECIALIZATION_ID) REFERENCES SPECIALIZATION(SPECIALIZATION_ID),
FOREIGN KEY (WORKS_AT) REFERENCES LOCATION_DETAILS(LOCATION_ID));

CREATE TABLE ILLNESS
(ILLNESS_ID INT NOT NULL,
ILLNESS_NAME VARCHAR(15) NOT NULL,
ACUTENESS INT NOT NULL,
ESTIMATED_RECOVERY_TIME INT NOT NULL,
PRIMARY KEY (ILLNESS_ID));

CREATE TABLE PATIENT
(SIN_NUMBER INT NOT NULL,
FIRST_NAME VARCHAR(15) NOT NULL,
LAST_NAME VARCHAR(15) NOT NULL,
ADDRESS_ID INT NOT NULL,
CONTACT_ID INT NOT NULL,
ACCOUNT DECIMAL(10,2) NOT NULL,
PRIMARY KEY (SIN_NUMBER),
FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID),
FOREIGN KEY (CONTACT_ID) REFERENCES CONTACT(CONTACT_ID));

CREATE TABLE TREATMENT
(TREATMENT_ID INT NOT NULL,
COST DECIMAL(10,2) NOT NULL,
TREATMENT_DATE DATETIME NOT NULL,
PRIMARY_DOCTOR INT NOT NULL,
ILLNESS_ID INT NOT NULL,
PATIENT_ID INT NOT NULL,
TREATMENT_LOCATION INT NOT NULL,
PRIMARY KEY (TREATMENT_ID),
FOREIGN KEY (PRIMARY_DOCTOR) REFERENCES EMPLOYEE(EMPLOYEE_ID),
FOREIGN KEY (ILLNESS_ID) REFERENCES ILLNESS(ILLNESS_ID),
FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(SIN_NUMBER),
FOREIGN KEY (TREATMENT_LOCATION) REFERENCES LOCATION_DETAILS(LOCATION_ID));

CREATE TABLE TREATS
(TREATMENT_ID INT NOT NULL,
EMPLOYEE_ID INT NOT NULL,
FOREIGN KEY(TREATMENT_ID) REFERENCES TREATMENT(TREATMENT_ID),
FOREIGN KEY(EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID));

CREATE TABLE PRESCRIPTION
(PRESCRIPTIONID CHAR(9) NOT NULL,
PRESCRIPTIONNAME VARCHAR(15) NOT NULL,
PRESCRIPTIONSTRENGTH VARCHAR(15) NOT NULL,
PRESCRIPTIONROUTE VARCHAR(15) NOT NULL,
FREQUENCY VARCHAR(15) NOT NULL,
AMOUNT VARCHAR(15) NOT NULL,
REFILLS INT NOT NULL,
TREATMENT_ID INT NOT NULL,
PRIMARY KEY (PRESCRIPTIONID),
FOREIGN KEY (TREATMENT_ID) REFERENCES TREATMENT(TREATMENT_ID));

CREATE TABLE PHARMACY
(PHARMACYID CHAR(9) NOT NULL,
LOCATION_INFO VARCHAR(15) NOT NULL,
NEAREST_HOSPITAL INT NOT NULL,
PRIMARY KEY (PHARMACYID),
FOREIGN KEY (NEAREST_HOSPITAL) REFERENCES LOCATION_DETAILS(LOCATION_ID));

CREATE TABLE HOSPITAL
(HOSPITAL_ID CHAR(9) NOT NULL,
ACCOUNT INT NOT NULL,
HOSPITAL_SPECIALIZATION VARCHAR(15) NOT NULL,
LOCATION_ID INT NOT NULL,
PRIMARY KEY (HOSPITAL_ID),
FOREIGN KEY (LOCATION_ID) REFERENCES LOCATION_DETAILS(LOCATION_ID));

/*
We will use the example of Greenview Medical Centre
to test the tables
*/

-- INSERT INTO ADDRESS (ADDRESS_ID, HOUSENUMBER, STREETNAME, POSTALCODE, CITY, PROVINCE)
-- VALUES (1,8979, 'Maple Avenue', 'N8D 3W0', 'Windsor', 'Ontario');

-- INSERT INTO ADDRESS (ADDRESS_ID, HOUSENUMBER, STREETNAME, POSTALCODE, CITY, PROVINCE)
-- VALUES (2,3553, 'Greenview Street', 'N7D 3Y0', 'Windsor', 'Ontario');

-- INSERT INTO CONTACT (CONTACT_ID, PHONE_NUMBER, EMAIL_ADDRESS)
-- VALUES(1, 2269832355, 'drkovac@greenviewmedical.com');

-- INSERT INTO CONTACT (CONTACT_ID, PHONE_NUMBER, EMAIL_ADDRESS)
-- VALUES(2, 5199908765, 'info@greenviewmedical.com');

-- INSERT INTO LOCATION_DETAILS (LOCATION_ID, LOCATION_NAME, ADDRESS_ID, CONTACT_ID)
-- VALUES(6, 'Greenview Medical Centre', 2, 2);

-- INSERT INTO EMPLOYEE_TYPE (EMPLOYEE_TYPE_ID, EMPLOYEE_ROLE)
-- VALUES(1, 'Doctor');

-- INSERT INTO EMPLOYEE_TYPE (EMPLOYEE_TYPE_ID, EMPLOYEE_ROLE)
-- VALUES(2, 'Nurse');

-- INSERT INTO SPECIALIZATION (SPECIALIZATION_ID, SPECIALIZATION, EMPLOYEE_TYPE_ID)
-- VALUES(1, 'Pediatrics', 1);

-- INSERT INTO SPECIALIZATION (SPECIALIZATION_ID, SPECIALIZATION, EMPLOYEE_TYPE_ID)
-- VALUES(2, 'Internal Medicine', 1);

-- INSERT INTO SPECIALIZATION (SPECIALIZATION_ID, SPECIALIZATION, EMPLOYEE_TYPE_ID)
-- VALUES(3, 'Surgery', 1);

-- INSERT INTO SPECIALIZATION (SPECIALIZATION_ID, SPECIALIZATION, EMPLOYEE_TYPE_ID)
-- VALUES(4, 'Cardiology', 1)

-- INSERT INTO EMPLOYEE (EMPLOYEE_ID, FNAME, LNAME, SALARY, HOURS, NUMPATIENT, CONTACT_ID, ADDRESS_ID, EMPLOYEE_TYPE_ID, SPECIALIZATION_ID)
-- VALUES(1,'Igor', 'Kovac', 220000, 60, 2, 1, 1, 1, 3);

-- INSERT INTO ILLNESS (ILLNESS_ID, ILLNESS_NAME, ACUTENESS, ESTIMATED_RECOVERY_TIME)
-- VALUES(1, 'Pneumonia', 5, 7);