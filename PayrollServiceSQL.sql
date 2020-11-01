/*Welcome to Employee Payroll Service*/

/*UC1-Creating Database*/
create database payroll_service;
use payroll_service;

/*UC2-Creating DataTable*/
create table employee_payroll(
id int NOT NULL identity(1,1) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
start_Date DATETIME NOT NULL ) ;

/*UC3-Inserting Values into dataTable*/
insert into employee_payroll(name,salary,start_date)
 values('tiru',20000.0,'2020-01-01');

 /*UC4-Retrieving Data*/
SELECT * FROM employee_payroll;

/*UC5-DataBetweenDates*/
Select salary from employee_payroll
 where start_Date between CAST('2000-01-01' AS date) and cast('2022-01-01' AS date);

 
/*UC6-Add Gender Column*/
Alter table employee_payroll 
add Gender char;

Update employee_payroll set Gender='M' where name='tiru';

/*UC7-Retrieving Sum, Average, Min, Max, Count*/

insert into employee_payroll(name,salary,start_date,gender)
 values('rtkr',25000.0,'2019-01-01','F');

insert into employee_payroll(name,salary,start_date,gender)
 values('ktr',19000.0,'2016-01-01','M');

select gender,sum(salary) As totalFemaleSalary from employee_payroll 
where gender='F' GROUP BY gender;

select gender,AVG(salary) As averageMaleSalary from employee_payroll 
where gender='M' GROUP BY gender;

select gender,MIN(BasicPay) As minimumMaleSalary from employee_payroll
Group by gender;

select gender,count(*) as Total from employee_payroll group by gender;

/*UC8-ExtendColumns*/
ALTER TABLE employee_payroll 
ADD phone VARCHAR(10),
address VARCHAR(10) DEFAULT 'Mumbai' NOT NULL,
department VARCHAR(5) DEFAULT 'RPA' NOT NULL;
SELECT * FROM employee_payroll;

/*UC9-ExtendColumns*/
ALTER TABLE employee_payroll 
ADD Deductions DECIMAL(10,2),
Taxableay DECIMAL(10,2);
EXEC sp_RENAME 'employee_payroll.salary', 'BasicPay', 'COLUMN';
SELECT * FROM employee_payroll;

/*UC10-ER_Diagram*/
/*UC11-CreatingDataTablesSeperately*/

CREATE TABLE company
(
 companyId INT PRIMARY KEY,
 companyName VARCHAR(9)  
);

CREATE TABLE employee
(
 empId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
 companyId INT REFERENCES company(companyId),
 empName VARCHAR(30) NOT NULL,
 phoneNo VARCHAR(10) NOT NULL,
 address VARCHAR(150) NOT NULL,
 city VARCHAR(30) NOT NULL,
 country VARCHAR(30) NOT NULL,
 start DATE DEFAULT '2020-09-18',
 gender CHAR
);

CREATE TABLE payroll
(
 empId INT REFERENCES employee(empId),
 basicPay DECIMAL(10,2) DEFAULT 0,
 deductions DECIMAL(10,2) DEFAULT 0,
 tax DECIMAL(10,2) DEFAULT 0,
 netPay DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE department
(
 deptId INT IDENTITY(100,1) NOT NULL PRIMARY KEY,
 deptName VARCHAR(30) NOT NULL
);

CREATE TABLE employeeDepartment
(
 empId INT REFERENCES employee(empId),
 deptId INT REFERENCES department(deptId)
);

INSERT INTO company(companyId,companyName) VALUES(420,'Capgemini');

INSERT INTO department(deptName) VALUES('Sales Team');

INSERT INTO employee(companyId,empName,phoneNo,address,city,country,gender) 
VALUES(420,'Indu',1234567890,'1-104,Sunnada','Srikakulam','India','F');

INSERT INTO payroll(empId,basicPay,deductions,tax,netPay) 
VALUES(4,19050,500,500,18050);

INSERT INTO employeeDepartment VALUES(4,100);

select*from company;
select*from department;
select*from employee;
select*from payroll;
select*from employeeDepartment;

select gender,SUM(netPay) AS totalSalary from employee,payroll
where employee.empId = payroll.empId
group by gender;

select gender,AVG(netPay) AS AvgSalary from employee,payroll
where employee.empId = payroll.empId
group by gender;

select gender,MIN(netPay) AS MinSalary from employee,payroll
where employee.empId = payroll.empId
group by gender;

select gender,Max(netPay) AS MaxSalary from employee,payroll
where employee.empId = payroll.empId
group by gender;

select gender,Count(netPay) AS CountSalaryAccounts from employee,payroll
where employee.empId = payroll.empId
group by gender;

select empName,deptName,netPay,companyName from employee,department,employeeDepartment,payroll,company
where employeeDepartment.empId = employee.empId 
AND department.deptId = employeeDepartment.deptId
AND payroll.empId = employeeDepartment.empId;
