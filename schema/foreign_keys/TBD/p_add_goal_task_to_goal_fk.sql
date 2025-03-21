drop procedure if exists p_add_goal_task_to_goal_fk;

DELIMITER //
create procedure p_add_goal_task_to_goal_fk()
	BEGIN
	alter table goal_task add constraint fk_goal_task_to_goal foreign key fk_goal_task_to_goal (goal_id) references goal(goal_id);
    END //

DELIMITER ;
