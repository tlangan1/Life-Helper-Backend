-- Track the time spent and by whom on tasks

DROP PROCEDURE if exists p_create_work_log;

DELIMITER //

CREATE PROCEDURE p_create_work_log()
	BEGIN
    drop table IF EXISTS work_log;

	create table work_log (
		work_log_id int not null auto_increment,
        task_id int not null,
        user_login_id int not null,
		started_work_dtm datetime not null,
		stopped_work_dtm datetime null,
		created_dtm datetime default current_timestamp not null,
		last_update_dtm datetime on update current_timestamp,
		PRIMARY KEY (work_log_id)
	);
	END //

DELIMITER ;