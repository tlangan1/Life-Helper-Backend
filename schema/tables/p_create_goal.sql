-- Every goal contains a collection of tasks
-- Every goal is a member of an objective

DROP PROCEDURE if exists p_create_goal;

DELIMITER //

CREATE PROCEDURE p_create_goal()
	BEGIN
    drop table IF EXISTS goal;

	create table goal (
		goal_id int not null auto_increment,
		goal_name varchar(50) not null,
		goal_description varchar(1000) not null,
		started_dtm datetime null,
		completed_dtm datetime null,
		deleted_dtm datetime null,
		create_dtm datetime default current_timestamp not null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (goal_id)
	);
	END //

DELIMITER ;