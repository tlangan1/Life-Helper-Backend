-- Add all goal_note foreign keys
drop procedure if exists p_add_objective_note_to_objective_fk;

DELIMITER //
create procedure p_add_objective_note_to_objective_fk()
	BEGIN
	alter table objective_note add constraint fk_objective_note_to_objective foreign key fk_objective_note_to_objective (objective_id) references objective(objective_id);
    END //

DELIMITER ;
