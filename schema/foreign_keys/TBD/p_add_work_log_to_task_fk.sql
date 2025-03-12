drop procedure if exists p_add_work_log_to_task_fk;

DELIMITER //
create procedure p_add_work_log_to_task_fk()
	BEGIN
	alter table work_log add constraint fk_work_log_to_task foreign key fk_work_log_to_task (task_id) references task(task_id);
    END //

DELIMITER ;
