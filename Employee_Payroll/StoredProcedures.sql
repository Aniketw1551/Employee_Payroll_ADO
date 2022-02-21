CREATE PROCEDURE spAddEmployeeDetails
@Name varchar(50),
@BasicPay int,
@StartDate Date,
@Gender char(2),
@PhoneNumber bigint,
@Department varchar(200),
@Address varchar(200),
@Deductions int,
@TaxablePay int,
@IncomeTax int,
@NetPay int
As
Begin
insert into employee_payroll(Name,Base_Pay,StartDate,Gender,PhoneNumber,Department,Address,Deductions,Taxable_Pay,Income_Tax,Net_Pay)
values(@Name,@BasicPay,@StartDate,@Gender,@PhoneNumber,@Department,@Address,@Deductions,@TaxablePay,@IncomeTax,@NetPay);
End

CREATE or Alter PROCEDURE spUpdateEmp
(
 @BasicPay int,
 @Name VARCHAR(200)
 )
 as
 begin
 update employee_payroll set Base_Pay=@BasicPay where Name=@Name;
end

CREATE or ALTER procedure spGetDataByDate
(
	@StartDate date,
	@EndDate date
)
AS
Begin
SELECT * FROM employee_payroll WHERE StartDate BETWEEN CAST(@StartDate AS DATE ) AND @EndDate;
End


CREATE or ALTER PROCEDURE spAddEmpPayrollDetails
(
	@employee_name varchar(30),
	@phone_no bigint,
	@address varchar(100),
	@gender char(2),
	@basic_pay int,	
	@deduction int,
        @taxable_pay int,
	@income_tax int,
        @net_pay int,
	@payroll_Id varchar(50),
	@department_Id int,
	@department_name varchar(20),
	@employee_id int
	
)
AS
BEGIN

	
	insert into Employee values(@employee_id, @employee_name, @gender, @phone_no, @address);
	insert into Payroll values(@payroll_Id, @basic_pay, @deduction, @taxable_pay, @income_tax, @net_pay, (SELECT employee_id FROM Employee WHERE employee_id=(SELECT MAX(employee_id) from Employee)));
	insert into Department values(@department_Id, @departmentName, (SELECT employee_id FROM Employee WHERE employee_id=(SELECT MAX(employee_id) from Employee)));
	

END

