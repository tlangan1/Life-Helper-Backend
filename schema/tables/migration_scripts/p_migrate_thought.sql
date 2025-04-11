drop procedure if exists p_migrate_thought;

DELIMITER //

create procedure p_migrate_thought()
	BEGIN
    insert into thought select * from t_thought;
    END //

DELIMITER ;