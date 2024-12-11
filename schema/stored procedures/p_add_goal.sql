DROP PROCEDURE IF exists p_add_goal;

DELIMITER //
CREATE PROCEDURE p_add_goal(IN type varchar(30), IN data varchar(1000))
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
			SET @params = JSON_OBJECT('sp_name', 'p_add_goal', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	START TRANSACTION;
	insert into goal (goal_name, goal_description) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.description')));
	insert into objective_goal (objective_id, goal_id) values (Convert(JSON_EXTRACT(data, '$.parent_id'), unsigned), LAST_INSERT_ID());
    COMMIT;
	END //

DELIMITER ;
