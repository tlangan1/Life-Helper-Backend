-- Every goal contains a collection of tasks
-- Every goal is a member of an objective

DROP PROCEDURE if exists p_create_goal;

DELIMITER //

CREATE PROCEDURE p_create_goal()
	BEGIN
    drop table IF EXISTS goal;

	create table goal (
		goal_id int not null auto_increment,
		item_name varchar(50) not null,
		item_description varchar(1000) not null,
		started_dtm datetime null,
		completed_dtm datetime null,
		canceled_dtm datetime null,
        canceling_user int null,
		created_dtm datetime default current_timestamp not null,
        creating_user int not null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (goal_id)
	);
	END //

DELIMITER ;