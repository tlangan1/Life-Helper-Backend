DROP PROCEDURE if exists p_drop_index;

DELIMITER //
CREATE PROCEDURE p_drop_index(IN table_name VARCHAR(50), index_name VARCHAR(50))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			select "An exception occurred in p_drop_index";
			GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
				@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
			SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
            select @full_error;
			INSERT INTO sql_error (sql_error, stored_procedure_name, create_dtm) values (@full_error, 'p_drop_index', now());
		END;
        
	SET @drop_idxSQL = CONCAT('alter table ', table_name, ' drop index ', index_name);

	SELECT '@drop_idxSQL' as variable_name, @drop_idxSQL AS variable_value;
	
    PREPARE prepared_statement FROM @drop_idxSQL ;
	EXECUTE prepared_statement;
	DEALLOCATE PREPARE prepared_statement;
END //

DELIMITER ;