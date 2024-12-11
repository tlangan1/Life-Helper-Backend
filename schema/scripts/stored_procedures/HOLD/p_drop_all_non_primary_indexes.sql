-- since the '_' is the wildcard for any single character you need to escape it
-- with a `\`, backslash, to include the literal underscoare in a string.

DROP PROCEDURE if exists p_drop_all_non_primary_indexes;

DELIMITER //
CREATE PROCEDURE p_drop_all_non_primary_indexes()
BEGIN
    DECLARE done BOOL DEFAULT false;
	DECLARE t_name VARCHAR(50) DEFAULT "";

	declare cur_tables CURSOR for select table_name from information_schema.TABLES
	where table_schema = database() and table_name not like 't\_%';

   	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

    -- open the cursor
    OPEN cur_tables;
    
	FETCH cur_tables into t_name;
    WHILE Not done DO
        select "call p_drop_non_primary_indexes_for_table(table_name)", t_name;
        call p_drop_non_primary_indexes_for_table(t_name);
		FETCH cur_tables into t_name;
	END WHILE;

	-- close the cursor
    CLOSE cur_tables;
END //

DELIMITER ;