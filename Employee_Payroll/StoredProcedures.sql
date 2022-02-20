using payroll_service;

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
 @BasicPay decimal,
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



