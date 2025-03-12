drop procedure if exists p_add_objective_goal_to_objective_fk;

DELIMITER //
create procedure p_add_objective_goal_to_objective_fk()
	BEGIN
	alter table objective_goal add constraint fk_objective_goal_to_objective foreign key fk_objective_goal_to_objective (objective_id) references objective(objective_id);
    END //

DELIMITER ;

