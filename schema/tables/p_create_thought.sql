DROP PROCEDURE if exists p_create_thought;

DELIMITER //

CREATE PROCEDURE p_create_thought()
	BEGIN
    drop table IF EXISTS thought;

	create table thought (
		thought_id int not null auto_increment,
		thought varchar(1000) not null,
        order_id int not null,
		created_dtm datetime default current_timestamp not null,
		deleted_dtm datetime null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (thought_id)
	);
	END //

DELIMITER ;