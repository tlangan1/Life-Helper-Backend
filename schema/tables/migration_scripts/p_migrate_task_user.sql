drop procedure if exists p_migrate_task_user;

DELIMITER //

create procedure p_migrate_task_user()
	BEGIN
    insert into task_user select * from t_task_user;
    END //

DELIMITER ;