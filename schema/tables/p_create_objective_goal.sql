-- A goal can be required by one or more objectives
drop procedure if exists p_create_objective_goal;

DELIMITER //
create procedure p_create_objective_goal()
	BEGIN
	drop table IF EXISTS objective_goal;

	create table objective_goal (
		objective_id int not null,
		goal_id int not null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (objective_id, goal_id)
	);
	END //

DELIMITER ;

