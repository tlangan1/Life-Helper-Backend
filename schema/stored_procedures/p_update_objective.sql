DROP PROCEDURE IF exists p_update_objective;

DELIMITER //
CREATE PROCEDURE p_update_objective(IN data JSON)
BEGIN
	Set @update_type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.update_type'));
  	set @user_login_id = JSON_EXTRACT(data, '$.user_login_id');


	CASE @update_type
		WHEN "abort" THEN
			update objective set aborted_dtm = current_timestamp(), aborting_user = @user_login_id
            where objective_id = JSON_EXTRACT(data, '$.item_id');
	END CASE;
END //
