using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Employee_Payroll
{
    internal class Program
    {
        public static void EmployeePayroll()
        { 
         EmployeeRepository employeeRepository = new EmployeeRepository();
            employeeRepository.GetEmployeeRecords();
        }
        static void Main(string[] args)
        {
        Console.WriteLine("Welcome to Employee Payroll program");
        EmployeePayroll();
        Console.ReadLine();
        }
    }
}
