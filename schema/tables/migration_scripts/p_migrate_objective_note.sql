drop procedure if exists p_migrate_objective_note;

DELIMITER //

create procedure p_migrate_objective_note()
	BEGIN
    insert into objective_note select * from t_objective_note;
    END //

DELIMITER ;