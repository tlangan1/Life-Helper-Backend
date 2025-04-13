DROP PROCEDURE IF exists p_update_running_task;

DELIMITER //
CREATE PROCEDURE p_update_running_task(IN data JSON)
BEGIN
	set @task_id = JSON_EXTRACT(data, '$.item_id');
	set @user_login_id = JSON_EXTRACT(data, '$.user_login_id');

	select t.task_id into @running_task_id from task t inner join task_user tu on t.task_id = tu.task_id
	where tu.user_login_id = @user_login_id
	and t.started_dtm is not null
	and t.paused_dtm is null
	and t.completed_dtm Is Null
	and t.canceled_dtm Is Null;
	
	if @running_task_id != @task_id then
		update task set paused_dtm = now() where task_id = @running_task_id;
        update work_log set stopped_work_dtm = now() 
        where task_id = @running_task_id
        and   stopped_work_dtm Is Null;
	end if;
END //

DELIMITER ;