drop procedure if exists p_migrate_trigger_log;

DELIMITER //

create procedure p_migrate_trigger_log()
	BEGIN
    insert into trigger_log select * from t_trigger_log;
    END //

DELIMITER ;