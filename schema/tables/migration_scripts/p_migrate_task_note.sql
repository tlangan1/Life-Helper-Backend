drop procedure if exists p_migrate_task_note;

DELIMITER //

create procedure p_migrate_task_note()
	BEGIN
    insert into task_note select * from t_task_note;
    END //

DELIMITER ;