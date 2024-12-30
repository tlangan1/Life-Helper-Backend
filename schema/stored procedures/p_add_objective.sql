DROP PROCEDURE IF exists p_add_objective;

DELIMITER //
CREATE PROCEDURE p_add_objective(IN type varchar(30), IN data JSON)
	BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
            -- I believe this is the correct way to guarantee all transactions are resolved
            -- with either a commit or rollback as this handler catches all SQL exceptions.
			GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
				@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;

            -- Always make sure the rollback proceeds the error logging.
            -- Otherwise, the error logging will also be rolled back.
            SET @error_information = JSON_OBJECT('error_number', @errno, 'sql_state', @sqlstate, 'error_text', @text);
			SET @params = JSON_OBJECT('sp_name', 'p_add_objective', 'error_information', @error_information, 'additional_information', data);
			call p_handle_db_error(@params);
        END;
	
    insert into objective (item_name, item_description) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_description')));
	END //

DELIMITER ;
