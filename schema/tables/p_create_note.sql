-- Any objective, goal or task may contain notes

DROP PROCEDURE if exists p_create_note;

DELIMITER //

CREATE PROCEDURE p_create_note()
	BEGIN
    drop table if exists note;
    
	create table note (
		note_id int not null auto_increment,
		note varchar(1000) not null,
		deleted_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (note_id)
	);
	END //

DELIMITER ;
