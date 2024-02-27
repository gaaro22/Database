set @@autocommit = 0;

start transaction;

select Idclient, concat(Fname, ' ', Lname) as Client_Name, CPF, Idorder, OrderStatus, PayDescription from clients join orders on Idclient = IdorderClient;
update orders set OrderStatus = 'Enviado' where Idorder = '3';

Commit;




/*
-- Comandos utilizados no backup e restore
mysqldump -u root -p company_constraints > C:\backup\backupCompany.sql;
mysqldump -u root -p ecommerce > C:\backup\backupEcommerce.sql;
mysqldump -u root -p NewDatabase < C:\backup\backupEcommerce.sql;
*/