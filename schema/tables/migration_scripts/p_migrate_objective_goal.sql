drop procedure if exists p_migrate_objective_goal;

DELIMITER //

create procedure p_migrate_objective_goal()
	BEGIN
    insert into objective_goal select * from t_objective_goal;
    END //

DELIMITER ;