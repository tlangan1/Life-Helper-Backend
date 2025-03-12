drop procedure if exists p_add_objective_note_to_note_fk;

DELIMITER //
create procedure p_add_objective_note_to_note_fk()
	BEGIN
	alter table objective_note add constraint fk_objective_note_to_note foreign key fk_objective_note_to_note (note_id) references note(note_id);
    END //

DELIMITER ;
