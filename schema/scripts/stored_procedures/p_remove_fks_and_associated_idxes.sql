-- alter table goal drop foreign key fk_goal_to_objective_1;
-- alter table goal drop index fk_goal_to_objective_1;

-- alter table task drop foreign key fk_task_to_goal_1;
-- alter table task drop index fk_task_to_goal_1;

DROP PROCEDURE if exists p_remove_fks_and_associated_idxes;

DELIMITER //
CREATE PROCEDURE p_remove_fks_and_associated_idxes()
BEGIN
    DECLARE done BOOL DEFAULT false;
	DECLARE item_name VARCHAR(50) DEFAULT "";
    DECLARE t_name VARCHAR(50) DEFAULT "";

	-- declare cursor for employee email
	declare cur CURSOR for SELECT constraint_name, table_name FROM information_schema.TABLE_CONSTRAINTS 
	WHERE TABLE_SCHEMA = 'life_helper'
	AND TABLE_CONSTRAINTS.CONSTRAINT_TYPE = 'FOREIGN KEY';
    
   	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

    -- open the cursor
    OPEN cur;
    
    process_table: LOOP
    
	FETCH cur into item_name, t_name;
		IF done = true THEN 
			LEAVE process_table;
		END IF;
        
        call p_drop_fk_and_idx(item_name, t_name);
	END LOOP;

	-- close the cursor
    CLOSE cur;

END //
DELIMITER ;