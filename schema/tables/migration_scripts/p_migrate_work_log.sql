drop procedure if exists p_migrate_work_log;

DELIMITER //

create procedure p_migrate_work_log()
	BEGIN
    insert into work_log select * from t_work_log;
    END //

DELIMITER ;