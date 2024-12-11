-- Drop all foreign keys
drop procedure if exists p_drop_all_foreign_keys;

DELIMITER //
create procedure p_drop_all_foreign_keys()
	BEGIN
    DECLARE done BOOL DEFAULT false;
    DECLARE t_name varchar(100);
    DECLARE fk_name varchar(100);
    
    declare cur_foreign_keys CURSOR for SELECT table_name, constraint_name FROM information_schema.table_constraints
		WHERE table_schema = database()
		and constraint_type = 'FOREIGN KEY';
        
	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

    -- open the cursor
    OPEN cur_foreign_keys;
    
	FETCH cur_foreign_keys into t_name, fk_name;
    WHILE Not done DO
		SET @drop_fkSQL = CONCAT('alter table ', t_name, ' drop foreign key ', fk_name);

		PREPARE prepared_statement FROM @drop_fkSQL;
		EXECUTE prepared_statement;
		DEALLOCATE PREPARE prepared_statement;
		FETCH cur_foreign_keys into t_name, fk_name;
	END WHILE;

	-- close the cursor
    CLOSE cur_foreign_keys;

	END //

DELIMITER ;