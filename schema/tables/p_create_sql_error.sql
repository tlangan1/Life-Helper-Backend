-- This entity is a place for stored procedures to persist sql errors
-- If they are coded to use it.


drop procedure if exists p_create_sql_error;

DELIMITER //

create procedure p_create_sql_error()
	BEGIN
	drop table IF EXISTS sql_error;

	create table sql_error (
		sql_error_id int not null auto_increment,
		sql_error varchar(1024) Not Null,
		stored_procedure_name varchar(50) not null,
        additional_information varchar(1024) not null,
		created_dtm datetime default current_timestamp not null,
		PRIMARY KEY (sql_error_id)
	);
    END //

DELIMITER ;