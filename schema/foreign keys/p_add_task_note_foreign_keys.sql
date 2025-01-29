-- Add all goal_note foreign keys
drop procedure if exists p_add_task_note_foreign_keys;

DELIMITER //
create procedure p_add_task_note_foreign_keys()
	BEGIN
	alter table task_note add constraint fk_task_note_to_task foreign key fk_task_note_to_task (task_id) references task(task_id);
	alter table task_note add constraint fk_task_note_to_note foreign key fk_task_note_to_note (note_id) references note(note_id);
    END //

DELIMITER ;
