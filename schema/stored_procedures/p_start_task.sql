DROP PROCEDURE IF exists p_start_task;

DELIMITER //
CREATE PROCEDURE p_start_task(IN data JSON)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
            -- I believe this is the correct way to guarantee all transactions are resolved
            -- with either a commit or rollback as this handler catches all SQL exceptions.
			GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
				@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
            rollback;

            -- Always make sure the rollback proceeds the error logging.
            -- Otherwise, the error logging will also be rolled back.
            SET @error_information = JSON_OBJECT('error_number', @errno, 'sql_state', @sqlstate, 'error_text', @text);
			SET @params = JSON_OBJECT('sp_name', 'p_start_task', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	START TRANSACTION;
	set @task_id = JSON_EXTRACT(data, '$.item_id');
    set @user_login_id = JSON_EXTRACT(data, '$.user_login_id');

	update task set started_dtm = current_timestamp where task_id = @task_id;
	insert into task_user (task_id, user_login_id, start_assignment_dtm) values (@task_id, @user_login_id, now());
    COMMIT;
END //
DELIMITER ;