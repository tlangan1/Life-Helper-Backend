-- Every goal contains a collection of tasks
-- Every goal is a member of an objective

DROP PROCEDURE if exists p_create_task;

DELIMITER //

CREATE PROCEDURE p_create_task()
	BEGIN
    drop table IF EXISTS task;

	create table task (
		task_id int not null auto_increment,
		item_name varchar(50) not null,
		item_description varchar(1000) not null,
		started_dtm datetime null,
        starting_user int null,
		paused_dtm datetime null,
		completed_dtm datetime null,
        completing_user int null,
		aborted_dtm datetime null,
        aborting_user int null,
		created_dtm datetime default current_timestamp not null,
        creating_user int not null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (task_id)
	);
	END //

DELIMITER ;