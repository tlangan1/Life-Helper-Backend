-- Add all goal_note foreign keys
drop procedure if exists p_add_goal_note_to_note_fk;

DELIMITER //
create procedure p_add_goal_note_to_note_fk()
	BEGIN
	alter table goal_note add constraint fk_goal_note_to_note foreign key fk_goal_note_to_note (note_id) references note(note_id);
    END //

DELIMITER ;
