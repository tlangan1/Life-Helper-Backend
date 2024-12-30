-- This table can be used to log the results of triggers for debugging purposes.

DROP PROCEDURE if exists p_create_trigger_log;

DELIMITER //

CREATE PROCEDURE p_create_trigger_log()
	BEGIN
	drop table IF EXISTS trigger_log;

    create table trigger_log (
        trigger_log_id int not null auto_increment,
        statement varchar(100) default null,
        integer_result int default null,
        string_result varchar(100) default null,
        create_dtm datetime default current_timestamp not null,
        PRIMARY KEY (trigger_log_id)
        );

    END //

DELIMITER ;
