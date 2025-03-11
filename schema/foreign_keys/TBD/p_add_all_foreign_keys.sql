-- Add all foreign keys
drop procedure if exists p_add_all_foreign_keys;

DELIMITER //
create procedure p_add_all_foreign_keys()
	BEGIN
    call p_add_goal_note_to_goal_fk();
    call p_add_goal_note_to_note_fk();
    call p_add_goal_task_to_goal_fk();
    call p_add_goal_task_to_task_fk();
	call p_add_objective_goal_to_goal_fk();
	call p_add_objective_goal_to_objective_fk();
    call p_add_objective_note_to_note_fk();
    call p_add_objective_note_to_objective_fk();
    call p_add_task_note_to_note_fk();
    call p_add_task_note_to_task_fk();
    call p_add_work_log_to_user_login_fk();
    call p_add_work_log_to_task_fk();
    END //
    
DELIMITER ;

