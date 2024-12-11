DROP PROCEDURE if exists p_remove_data;

DELIMITER //
CREATE PROCEDURE p_remove_data()
	BEGIN
    DECLARE done BOOL DEFAULT false;
	DECLARE t_name VARCHAR(50);
	DECLARE all_tables CURSOR FOR select table_name from information_schema.tables where table_schema = 'life_helper' and table_type = 'BASE TABLE' and table_name not like 't\_%';
    
	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

	call p_drop_all_foreign_keys();

    -- open the cursor
    OPEN all_tables;
	
	FETCH all_tables into t_name;

    WHILE Not done DO
		call p_archive_and_clear_table_data(t_name);
		FETCH all_tables into t_name;
	END WHILE;

	-- close the cursor
    CLOSE all_tables;
END //

DELIMITER ;