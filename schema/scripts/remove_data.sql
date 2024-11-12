DROP PROCEDURE p_remove_data;

DELIMITER //
CREATE PROCEDURE p_remove_data()
	BEGIN
    
    DECLARE done BOOL DEFAULT false;
	DECLARE table_name VARCHAR(50) DEFAULT "";

	-- alter table goal drop foreign key fk_goal_to_objective_1;
	-- alter table goal drop index fk_goal_to_objective_1;

	-- alter table task drop foreign key fk_task_to_goal_1;
	-- alter table task drop index fk_task_to_goal_1;

	-- declare cursor for employee email
	DECLARE tables CURSOR FOR select table_name from information_schema.tables where table_schema = 'life_helper' and table_type = 'BASE TABLE' and table_name not like 't\_%';
    
	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;
	
    -- open the cursor
    OPEN tables;
	
    process_table: LOOP
    
		FETCH tables into table_name;
			IF done = true THEN 
				LEAVE process_table;
			END IF;
		call p_archive_and_clear_table_data(table_name);
	END LOOP;

	-- close the cursor
    CLOSE tables;
    

	-- 	call p_archive_and_clear_table_data('task');
	-- 	call p_archive_and_clear_table_data('goal');
	-- 	call p_archive_and_clear_table_data('objective');
	-- 	call p_archive_and_clear_table_data('web_push_subscription');	
END //

DELIMITER ;