DROP PROCEDURE IF exists p_add_task_note;

DELIMITER //
CREATE PROCEDURE p_add_task_note(IN data JSON)
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
			SET @params = JSON_OBJECT('sp_name', 'p_add_task_note', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	START TRANSACTION;
	insert into note (note) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.note_text')));
	insert into task_note (task_id, note_id) values (JSON_EXTRACT(data, '$.parent_id'), LAST_INSERT_ID());
    COMMIT;
	END //

DELIMITER ;
