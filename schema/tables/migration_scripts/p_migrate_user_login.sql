drop procedure if exists p_migrate_user_login;

DELIMITER //

create procedure p_migrate_user_login()
	BEGIN
    insert into user_login select * from t_user_login;
    END //

DELIMITER ;