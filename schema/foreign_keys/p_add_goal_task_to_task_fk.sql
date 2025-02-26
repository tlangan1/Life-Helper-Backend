drop procedure if exists p_add_goal_task_to_task_fk;

DELIMITER //
create procedure p_add_goal_task_to_task_fk()
	BEGIN
	alter table goal_task add constraint fk_goal_task_to_task foreign key fk_goal_task_to_task (task_id) references task(task_id);
    END //

DELIMITER ;
