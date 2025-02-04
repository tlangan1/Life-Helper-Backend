drop procedure if exists p_migrate_note;

DELIMITER //

create procedure p_migrate_note()
	BEGIN
    insert into note select * from t_note;
    END //

DELIMITER ;