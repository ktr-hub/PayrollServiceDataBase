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

