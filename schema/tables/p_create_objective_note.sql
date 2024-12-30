drop procedure if exists p_create_objective_note;

DELIMITER //
create procedure p_create_objective_note()
	BEGIN
	drop table IF EXISTS objective_note;

	create table objective_note (
		objective_id int not null,
		note_id int not null,
		deleted_dtm datetime null,
		create_dtm datetime default current_timestamp not null,
		PRIMARY KEY (objective_id, note_id)
	);
	END //

DELIMITER ;