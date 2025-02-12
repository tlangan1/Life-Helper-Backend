drop procedure if exists p_create_task_note;

DELIMITER //
create procedure p_create_task_note()
	BEGIN
	drop table IF EXISTS task_note;

	create table task_note (
		task_id int not null,
		note_id int not null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (task_id, note_id)
	);
	END //

DELIMITER ;