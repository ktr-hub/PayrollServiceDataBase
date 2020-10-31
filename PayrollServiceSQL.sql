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

