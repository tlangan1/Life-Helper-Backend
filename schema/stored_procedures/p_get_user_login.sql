DROP PROCEDURE IF exists p_get_user_login;

DELIMITER //
CREATE PROCEDURE p_get_user_login(IN data JSON)
BEGIN
	Set @user_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.user_name'));
    Set @user_working = "false";
    Set @daily_working_elapsed_time = 0;
    select user_login_id into @user_login_id from user_login where user_name = @user_name;

	IF @user_login_id Is Not Null THEN
		select "true" into @user_working
        where exists (select 1 from work_log wl
						where wl.user_login_id = @user_login_id
                        and   wl.stopped_work_dtm Is Null);
		
        set @elapsed_work_time = 0;
		set @data = JSON_OBJECT("start_dtm", curdate(), "end_dtm", date_add(curdate(), INTERVAL 1 day), "user_login_id", @user_login_id);
        call p_calculate_worked_time(@data, @elapsed_work_time);
    END IF;
    
    select ul.*, @user_working as user_working, @elapsed_work_time as elapsed_work_time from user_login ul where user_name = @user_name;
END //
DELIMITER ;
