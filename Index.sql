-- Qual o departamento com maior número de pessoas? 
SELECT 
    Dname AS Departament_Name, COUNT(*) AS Number_of_Peoples
FROM
    employee
        INNER JOIN
    departament ON Dnumber = Dno
GROUP BY Dno
ORDER BY Number_of_Peoples DESC;

-- Quais são os departamentos por cidade? 
SELECT 
    Dname AS Departament, Dlocation AS City
FROM
    departament d
        INNER JOIN
    dept_locations dl ON d.Dnumber = dl.Dnumber;

-- Relação de empregrados por departamento.
SELECT 
    CONCAT(Fname, ' ', Lname) AS Employee,
    Ssn,
    Dname AS Departament,
    Dno AS Departament_Number
FROM
    employee
        INNER JOIN
    departament ON Dno = Dnumber;


create index DeptLocation_Idx on dept_locations(
	Dlocation
);

create index Departament_Name_Idx on departament(
	Dname
);

create index Employee_Name_Idx on employee(
	Fname, Lname
);
-- Os índices acima foram criados baseando-se na necessidade de uso das colunas.
-- Ou seja, as colunas que mais foram utilizadas de cada tabela, conforme o script das querys.