delimiter $
CREATE TRIGGER backup_before_delete
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
    INSERT INTO users_backup (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
    VALUES (OLD.Fname, OLD.Minit, OLD.Lname, OLD.Ssn, OLD.Bdate, OLD.Address, OLD.Sex, OLD.Salary, OLD.Super_ssn, OLD.Dno);
END;
delimiter $;





delimiter //
CREATE TRIGGER update_salary
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF NEW.Salary <> OLD.Salary THEN
        INSERT INTO salary_history (Fname, Lname, Ssn, Old_salary, New_salary, Update_date)
        VALUES (Fname, Lname, Ssn, Old.Salary, New.Salary, now());
    END IF;
END;
delimiter;