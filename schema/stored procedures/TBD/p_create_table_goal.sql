-- Every goal contains a collection of tasks
-- Every goal is a member of an objective

DROP PROCEDURE IF exists p_create_table_goal;

DELIMITER //

CREATE PROCEDURE p_create_table_goal()
BEGIN
    DECLARE goal_table_exists boolean default false;
    DECLARE task_table_exists boolean default false;

	drop table if exists t_goal;

	-- select 'before setting table exists', goal_table_exists;

	SET goal_table_exists = (SELECT EXISTS (SELECT table_name
		FROM information_schema.TABLES 
		WHERE table_schema LIKE 'life_helper' AND 
        table_name = 'goal'
		));

	IF goal_table_exists THEN
		create table t_goal as select * from goal;
    END IF;
    
	SET task_table_exists = (SELECT EXISTS (SELECT table_name
		FROM information_schema.TABLES 
		WHERE table_schema LIKE 'life_helper' AND 
        table_name = 'task'
		));

	IF task_table_exists THEN
		alter table task drop foreign key task_ibfk_1;
	END IF;
    
    drop table IF EXISTS goal;

	CREATE TABLE goal (
		goal_id INT NOT NULL AUTO_INCREMENT,
		goal_name VARCHAR(50) NOT NULL,
		goal_description VARCHAR(1000) NOT NULL,
		objective_id INT NOT NULL,
		started_dtm DATETIME NULL,
		completed_dtm DATETIME NULL,
		deleted_dtm DATETIME NULL,
		create_dtm DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
		last_update_dtm DATETIME ON UPDATE CURRENT_TIMESTAMP,
		PRIMARY KEY (goal_id)
	);

	alter table goal add constraint fk_objective_1 foreign key fk_objective(objective_id) references objective(objective_id);

	IF task_table_exists THEN
		alter table task add constraint fk_goal_1 foreign key fk_goal(goal_id) references goal(goal_id);
    END IF;
    
    -- Note, this code is unique to the exact change being implemented.
	-- Since I am testing this script without making any changes to the structure
	-- of the table the select is a simple select * from t_goal
	IF goal_table_exists THEN
		insert into goal select * from t_goal;
	END IF;
END //
    
DELIMITER ;
