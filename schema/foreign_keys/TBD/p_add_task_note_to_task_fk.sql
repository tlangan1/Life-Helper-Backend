drop procedure if exists p_add_task_note_to_task_fk;

DELIMITER //
create procedure p_add_task_note_to_task_fk()
	BEGIN
	alter table task_note add constraint fk_task_note_to_task foreign key fk_task_note_to_task (task_id) references task(task_id);
    END //

DELIMITER ;
