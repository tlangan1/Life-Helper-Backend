DROP PROCEDURE IF exists p_handle_db_error;

DELIMITER //
CREATE PROCEDURE p_handle_db_error(IN error_event_information varchar(1000))
	BEGIN
        SET @sp_name = JSON_UNQUOTE(JSON_EXTRACT(error_event_information, '$.sp_name'));
        SET @error_information = JSON_UNQUOTE(JSON_EXTRACT(error_event_information, '$.error_information'));
        SET @additional_information = JSON_EXTRACT(error_event_information, '$.additional_information');
        SET @error_no = JSON_EXTRACT(@error_information, '$.error_number');
        SET @sql_state = JSON_EXTRACT(@error_information, '$.sql_state');
        SET @error_text = JSON_EXTRACT(@error_information, '$.error_text');
		SET @sql_error = CONCAT('ERROR errno ', @error_no, ' (sqlstate ', @sql_state, '): ', @error_text);
        
        select @sp_name as 'stored procedure name', @error_information as 'SQL error', @additional_information as 'Additional Information';
		INSERT INTO sql_error (sql_error, stored_procedure_name, additional_information, create_dtm) values (@sql_error, @sp_name, @additional_information, now());
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = @error_text;
    END //

DELIMITER ;