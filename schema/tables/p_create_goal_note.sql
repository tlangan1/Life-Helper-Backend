drop procedure if exists p_create_goal_note;

DELIMITER //
create procedure p_create_goal_note()
	BEGIN
	drop table IF EXISTS goal_note;

	create table goal_note (
		goal_id int not null,
		note_id int not null,
		deleted_dtm datetime null,
		create_dtm datetime default current_timestamp not null,
		PRIMARY KEY (goal_id, note_id)
	);
	END //

DELIMITER ;