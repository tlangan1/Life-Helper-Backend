-- Every objective contains a collection of zero or more goals
-- Every goal contains a collection of zero or more tasks

DROP PROCEDURE if exists p_create_objective;

DELIMITER //

CREATE PROCEDURE p_create_objective()
	BEGIN
    drop table if exists objective;
    
	create table objective (
		objective_id int not null auto_increment,
		item_name varchar(50) not null,
		item_description varchar(1000) not null,
		started_dtm datetime null,
		completed_dtm datetime null,
		aborted_dtm datetime null,
        aborting_user int null,
		created_dtm datetime default current_timestamp not null,
        creating_user int not null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (objective_id)
	);
	END //

DELIMITER ;
