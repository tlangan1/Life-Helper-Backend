-- Add all objective_goal foreign keys
drop procedure if exists p_add_objective_goal_foreign_keys;

DELIMITER //
create procedure p_add_objective_goal_foreign_keys()
	BEGIN
	alter table objective_goal add constraint fk_objective_goal_to_objective foreign key fk_objective_goal_to_objective (objective_id) references objective(objective_id);
	alter table objective_goal add constraint fk_objective_goal_to_goal foreign key fk_objective_goal_to_goal (goal_id) references goal(goal_id);
    END //

DELIMITER ;

