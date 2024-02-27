CREATE VIEW employees_by_departments AS
    SELECT 
        Dname AS Department,
        Dno AS Department_Number,
        COUNT(*) Employee_by_Depto
    FROM
        employee
            INNER JOIN
        departament ON Dno = Dnumber group by Dno;
select * from employees_by_departments;


CREATE VIEW manager_by_department AS
    SELECT 
        Dname AS Department,
        Dnumber AS Department_Number,
        Mgr_ssn AS Manager_Ssn
    FROM
        departament;
select * from manager_by_department;


CREATE VIEW Projects_Employees AS
    SELECT 
        Pname AS Project, COUNT(*) AS Employees
    FROM
        project
            INNER JOIN
        departament ON Dnum = Dnumber
            INNER JOIN
        employee ON Dno = Dnumber
    GROUP BY Pname;
select * from Projects_Employees;


CREATE VIEW Project_Department_Manager AS
    SELECT 
        Pname AS Project, Dname AS Department, Mgr_ssn AS Manager
    FROM
        project
            INNER JOIN
        departament ON Dnum = Dnumber;
select * from Project_Department_Manager;


CREATE VIEW Employee_Dependent_Manager_vw AS
    SELECT 
        CONCAT(Fname, ' ', Lname) AS Employees,
        Ssn,
        COUNT(*) AS Dependents,
        CASE
            WHEN Ssn = Essn AND Super_ssn = Mgr_ssn THEN 'YES'
            ELSE 'NO'
        END AS Manager
    FROM
        employee
            JOIN
        dependent ON Ssn = Essn
            JOIN
        Departament ON Super_ssn = Mgr_ssn
    WHERE
        Ssn = Essn
    GROUP BY Ssn;
select * from Employee_Dependent_Manager_vw;


create user 'Employee_user'@'localhost' identified by '101010';
create user 'Manager_user'@'localhost' identified by '202020';

GRANT SELECT, UPDATE ON
company_constraints.employees_by_departments,
company_constraints.manager_by_department,
company_constraints.Projects_Employees,
company_constraints.Project_Department_Manager,
company_constraints.Employee_Dependent_Manager_vw to 'Manager_user'@'localhost';

GRANT SELECT, UPDATE ON
company_constraints.Projects_Employees,
company_constraints.Project_Department_Manager,
company_constraints.Employee_Dependent_Manager_vw to 'Employee_user'@'localhost';