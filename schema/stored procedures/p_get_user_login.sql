DROP PROCEDURE IF exists p_get_user_login;

DELIMITER //
CREATE PROCEDURE p_get_user_login(IN data JSON)
BEGIN
	Set @user_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.user_name'));
    
    select * from user_login where user_name = @user_name;
END //
DELIMITER ;
