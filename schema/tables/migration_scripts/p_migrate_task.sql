drop procedure if exists p_migrate_task;

DELIMITER //

create procedure p_migrate_task()
	BEGIN
    insert into task select * from t_task;
    END //

DELIMITER ;