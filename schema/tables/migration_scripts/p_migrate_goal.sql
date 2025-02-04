drop procedure if exists p_migrate_goal;

DELIMITER //

create procedure p_migrate_goal()
	BEGIN
    insert into goal select * from t_goal;
    END //

DELIMITER ;