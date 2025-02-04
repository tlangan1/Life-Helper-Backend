drop procedure if exists p_migrate_goal_note;

DELIMITER //

create procedure p_migrate_goal_note()
	BEGIN
    insert into goal_note select * from t_goal_note;
    END //

DELIMITER ;