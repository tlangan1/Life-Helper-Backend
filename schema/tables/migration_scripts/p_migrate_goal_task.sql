drop procedure if exists p_migrate_goal_task;

DELIMITER //

create procedure p_migrate_goal_task()
	BEGIN
    insert into goal_task select * from t_goal_task;
    END //

DELIMITER ;