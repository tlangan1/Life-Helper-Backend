-- Every goal contains a collection of tasks
-- Every goal is a member of an objective

DROP PROCEDURE if exists p_create_task;

DELIMITER //

CREATE PROCEDURE p_create_task()
	BEGIN
    drop table IF EXISTS task;

	create table task (
		task_id int not null auto_increment,
		task_name varchar(50) not null,
		task_description varchar(1000) not null,
		started_dtm datetime null,
		completed_dtm datetime null,
		deleted_dtm datetime null,
		create_dtm datetime default current_timestamp not null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (task_id)
	);
	END //

DELIMITER ;