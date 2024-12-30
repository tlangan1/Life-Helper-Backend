-- Add all foreign keys
drop procedure if exists p_add_all_foreign_keys;

DELIMITER //
create procedure p_add_all_foreign_keys()
	BEGIN
	call p_add_objective_goal_foreign_keys();
	call p_add_goal_task_foreign_keys();
    call p_add_objective_note_foreign_keys();
    call p_add_goal_note_foreign_keys();
    call p_add_task_note_foreign_keys();
    END //
    
DELIMITER ;

