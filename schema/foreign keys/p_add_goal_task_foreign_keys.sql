-- Add all goal_task foreign keys
drop procedure if exists p_add_goal_task_foreign_keys;

DELIMITER //
create procedure p_add_goal_task_foreign_keys()
	BEGIN
	alter table goal_task add constraint fk_goal_task_to_goal foreign key fk_goal_task_to_goal (goal_id) references goal(goal_id);
	alter table goal_task add constraint fk_goal_task_to_task foreign key fk_goal_task_to_task (task_id) references task(task_id);
    END //

DELIMITER ;
