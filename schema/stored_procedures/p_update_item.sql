DROP PROCEDURE IF exists p_update_item;

DELIMITER //
CREATE PROCEDURE p_update_item(IN item_type varchar(30), IN data JSON)
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
			SET @params = JSON_OBJECT('sp_name', 'p_update_item', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	START TRANSACTION;

	CASE item_type
		WHEN "objective" THEN
            call p_update_objective(data);
		WHEN "goal" THEN
			call p_update_goal(data);
		WHEN "task" THEN
			call p_update_task(data);
-- 		WHEN "web_push_subscription" THEN
-- 		WHEN "note" THEN
-- 		WHEN "user_login" THEN
	END CASE;
    
    COMMIT;
END //
DELIMITER ;