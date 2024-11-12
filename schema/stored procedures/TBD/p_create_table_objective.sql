-- Every objective contains a collection of goals
-- Every goal contains a collection of tasks

DROP PROCEDURE IF exists p_create_table_objective;

DELIMITER //
CREATE PROCEDURE p_create_table_objective()
BEGIN
    DECLARE objective_table_exists boolean default false;
    DECLARE goal_table_exists boolean default false;

	drop table if exists t_objective;

	-- select 'before setting table exists', objective_table_exists;

	SET objective_table_exists = (SELECT EXISTS (SELECT table_name
		FROM information_schema.TABLES 
		WHERE table_schema LIKE 'life_helper' AND 
        table_name = 'objective'
		));

	-- select 'after setting table exists', objective_table_exists;

	IF objective_table_exists THEN
		create table t_objective as select * from objective;
    END IF;
    
	select 'before setting goal_table_exists', goal_table_exists;

	SET goal_table_exists = (SELECT EXISTS (SELECT table_name
		FROM information_schema.TABLES 
		WHERE table_schema LIKE 'life_helper' AND 
        table_name = 'goal'
		));

	select 'after setting goal_table_exists', goal_table_exists;

	IF goal_table_exists THEN
		select 'dropping forrign key';
		alter table goal drop foreign key goal_ibfk_1;
    END IF;
    
	drop table IF EXISTS objective;

	create table objective (
		objective_id int not null auto_increment,
		objective_name varchar(50) not null,
		objective_description varchar(1000) not null,
		started_dtm datetime null,
		completed_dtm datetime null,
		deleted_dtm datetime null,
		create_dtm datetime default current_timestamp not null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (objective_id)
	);

	select 'before adding foreign key';

	IF goal_table_exists THEN
		select "in add foreign key on objective_id to goal";
		alter table goal add foreign key fk_objective(objective_id) references objective(objective_id);
    END IF;

	select 'after adding foreign key';
    
	-- Note, this code is unique to the exact change being implemented.
	-- Since I am testing this script without making any changes to the structure
	-- of the table the select is a simple select * from t_objective
	IF objective_table_exists THEN
		insert into objective select * from t_objective;
	END IF;
END //
DELIMITER ;