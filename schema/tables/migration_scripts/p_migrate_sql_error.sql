drop procedure if exists p_migrate_sql_error;

DELIMITER //

create procedure p_migrate_sql_error()
	BEGIN
    insert into sql_error select * from t_sql_error;
    END //

DELIMITER ;