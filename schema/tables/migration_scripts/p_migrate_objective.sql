drop procedure if exists p_migrate_objective;

DELIMITER //

create procedure p_migrate_objective()
	BEGIN
    insert into objective select * from t_objective;
    END //

DELIMITER ;