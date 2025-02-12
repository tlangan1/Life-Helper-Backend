-- A goal can be required by one or more objectives
drop procedure if exists p_create_goal_task;

DELIMITER //
create procedure p_create_goal_task()
	BEGIN
	drop table IF EXISTS goal_task;

	create table goal_task (
		goal_id int not null,
		task_id int not null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (goal_id, task_id)
	);
	END //

DELIMITER ;