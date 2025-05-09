DROP PROCEDURE IF exists p_add_user_login;

DELIMITER //
CREATE PROCEDURE p_add_user_login(IN data JSON)
	BEGIN
    set @user_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.user_name'));
    set @hashed_password = JSON_UNQUOTE(JSON_EXTRACT(data, '$.hashed_password'));
    set @full_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.full_name'));
    set @display_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.display_name'));
    set @email_address = JSON_UNQUOTE(JSON_EXTRACT(data, '$.email_address'));

	insert into user_login (user_name, hashed_password, full_name, display_name, email_address)
    values (@user_name, @hashed_password, @full_name, @display_name, @email_address);
	END //

DELIMITER ;
