DROP PROCEDURE if exists p_drop_foreign_key

DELIMITER //
CREATE PROCEDURE p_drop_foreign_key(IN table_name VARCHAR(50), foreign_key_name VARCHAR(50))
BEGIN
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		BEGIN
			select "An exception occurred in p_drop_foreign_key";
        END;
        
	SET @drop_fkSQL = CONCAT('alter table ', table_name, ' drop foreign key ', foreign_key_name);

	SELECT '@drop_fkSQL' AS variable_name, @drop_fkSQL AS variable_value;
	
    PREPARE prepared_statement FROM @drop_fkSQL;
	EXECUTE prepared_statement;
	DEALLOCATE PREPARE prepared_statement;
END //

DELIMITER ;