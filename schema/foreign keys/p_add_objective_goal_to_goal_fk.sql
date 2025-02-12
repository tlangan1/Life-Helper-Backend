-- Add all objective_goal foreign keys
drop procedure if exists p_add_objective_goal_to_goal_fk;

DELIMITER //
create procedure p_add_objective_goal_to_goal_fk()
	BEGIN
	alter table objective_goal add constraint fk_objective_goal_to_goal foreign key fk_objective_goal_to_goal (goal_id) references goal(goal_id);
    END //

DELIMITER ;

