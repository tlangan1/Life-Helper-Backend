-- This entity allows the user to "stack" the tasks in the
-- order in which the plan to do them.

DROP PROCEDURE if exists p_create_stacked_task;

DELIMITER //

CREATE PROCEDURE p_create_stacked_task()
	BEGIN
    drop table IF EXISTS stacked_task;

	create table stacked_task (
		stacked_task_id int not null auto_increment,
        order_id int not null,
		PRIMARY KEY (stacked_task_id)
	);
	END //

DELIMITER ;