DROP PROCEDURE if exists p_remove_data;

DELIMITER //
CREATE PROCEDURE p_remove_data()
	BEGIN
    
    DECLARE done BOOL DEFAULT false;
	DECLARE item_name VARCHAR(50) DEFAULT "";

	-- declare cursor
	DECLARE cur CURSOR FOR select table_name from information_schema.tables where table_schema = 'life_helper' and table_type = 'BASE TABLE' and table_name not like 't\_%';
    
	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

    -- open the cursor
    OPEN cur;
    
    process_table: LOOP
    
	FETCH cur into item_name;
		IF done = true THEN 
			LEAVE process_table;
		END IF;
		call p_archive_and_clear_table_data(item_name);
	END LOOP;

	-- close the cursor
    CLOSE cur;
END //

DELIMITER ;