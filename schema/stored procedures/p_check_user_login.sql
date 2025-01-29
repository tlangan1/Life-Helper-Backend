drop procedure if exists p_check_user_login;

DELIMITER //

create procedure p_check_user_login(IN data JSON)
	BEGIN
    -- To test this stored procedure from the command line remember
    -- to reset the user variable before each test
	-- set @hashed_password = null;
	-- call p_check_user_login('{"user_name": "Tom.Langan@Comcast.net", "hashed_password": "$2b$10$BDsUwGu6G9/y50N3DaC8ouZpOGo8/0mJYF5cP9DHj6EhipwVw.1De"}');
	-- /* login valid */

	-- set @hashed_password = null;
	-- call p_check_user_login('{"user_name": "Fred", "hashed_password": "$2b$10$BDsUwGu6G9/y50N3DaC8ouZpOGo8/0mJYF5cP9DHj6EhipwVw.1De"}');
	-- /* user name or password wrong */

	-- set @hashed_password = null;
	-- call p_check_user_login('{"user_name": "Tom.Langan@Comcast.net", "hashed_password": "Fred"}');
	-- /* user name or password wrong */
    
    
    set @no_match_response = "user name or password wrong";

    select hashed_password into @hashed_password from user_login where user_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.user_name'));
    
    if @hashed_password is null THEN
		select @no_match_response as response;
	elseif @hashed_password = JSON_UNQUOTE(JSON_EXTRACT(data, '$.hashed_password')) THEN
		select "login valid" as response;
	else
		select @no_match_response as response;
	END IF;
    END //

DELIMITER ;


