drop procedure if exists p_migrate_user_login;

DELIMITER //

create procedure p_migrate_user_login()
	BEGIN
    insert into user_login (user_login_id, user_name, hashed_password, full_name, display_name, email_address, created_dtm, deleted_dtm )
    select user_login_id, user_name, hashed_password, full_name, display_name, null, create_dtm, deleted_dtm from t_user_login;
    END //

DELIMITER ;