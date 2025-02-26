DROP PROCEDURE IF exists p_attach_item;

DELIMITER //
CREATE PROCEDURE p_attach_item(IN type varchar(30), IN data JSON)
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
			SET @params = JSON_OBJECT('sp_name', 'p_attach_item', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	CASE type
		WHEN "goal" THEN
			insert into objective_goal (objective_id, goal_id) values (JSON_EXTRACT(data, '$.parent_id'), JSON_EXTRACT(data, '$.child_id'));
		WHEN "task" THEN
			insert into goal_task (goal_id, task_id) values (JSON_EXTRACT(data, '$.parent_id'), JSON_EXTRACT(data, '$.child_id'));
	END CASE;
END //
DELIMITER ;