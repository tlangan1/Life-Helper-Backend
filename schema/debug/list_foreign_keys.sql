select * from task;

SELECT constraint_name, table_name, constraint_type FROM information_schema.TABLE_CONSTRAINTS 
	WHERE TABLE_SCHEMA = 'life_helper'
	AND TABLE_CONSTRAINTS.CONSTRAINT_TYPE = 'FOREIGN KEY'
    AND TABLE_NAME = 'objective_goal';
    
select * from sql_error;

-- delete from sql_error where 1 = 1
