-- Add all goal_note foreign keys
drop procedure if exists p_add_objective_note_foreign_keys;

DELIMITER //
create procedure p_add_objective_note_foreign_keys()
	BEGIN
	alter table objective_note add constraint fk_objective_note_to_objective foreign key fk_objective_note_to_objective (objective_id) references objective(objective_id);
	alter table objective_note add constraint fk_objective_note_to_note foreign key fk_objective_note_to_note (note_id) references note(note_id);
    END //

DELIMITER ;
