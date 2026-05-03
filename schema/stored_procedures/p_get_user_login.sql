DROP PROCEDURE IF exists p_get_user_login;

DELIMITER //
CREATE PROCEDURE p_get_user_login(IN data JSON)
BEGIN
	Set @user_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.user_name'));
    Set @user_working = false;
    Set @elapsed_work_time = 0;
    select user_login_id into @user_login_id from user_login where user_name = @user_name;

	IF @user_login_id Is Not Null THEN
        CALL p_get_user_working_status_today(
            @user_login_id,
            @user_working,
            @elapsed_work_time
        );
    END IF;
    
    select ul.*, @user_working as user_working, @elapsed_work_time as elapsed_work_time from user_login ul where user_name = @user_name;
END //
DELIMITER ;
