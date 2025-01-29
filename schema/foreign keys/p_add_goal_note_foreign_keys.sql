-- Add all goal_note foreign keys
drop procedure if exists p_add_goal_note_foreign_keys;

DELIMITER //
create procedure p_add_goal_note_foreign_keys()
	BEGIN
	alter table goal_note add constraint fk_goal_note_to_goal foreign key fk_goal_note_to_goal (goal_id) references goal(goal_id);
	alter table goal_note add constraint fk_goal_note_to_note foreign key fk_goal_note_to_note (note_id) references note(note_id);
    END //

DELIMITER ;
