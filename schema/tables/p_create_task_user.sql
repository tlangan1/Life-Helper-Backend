-- The relationship between task and task_user is usually 1 to 1.
-- The only time it is not is if the user gets reassigned.

-- A task can be reassigned only if it is in the paused state.

drop procedure if exists p_create_task_user;

DELIMITER //
create procedure p_create_task_user()
	BEGIN
	drop table IF EXISTS task_user;

	create table task_user (
		task_id int not null,
		user_login_id int not null,
		start_assignment_dtm datetime null,
		end_assignment_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (task_id, user_login_id)
	);
	END //

DELIMITER ;