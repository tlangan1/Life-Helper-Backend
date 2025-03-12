DROP PROCEDURE IF exists p_update_task;

DELIMITER //
CREATE PROCEDURE p_update_task(IN data JSON)
BEGIN
	Set @update_type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.update_type'));
	set @task_id = JSON_EXTRACT(data, '$.item_id');
	set @user_login_id = JSON_EXTRACT(data, '$.user_login_id');

	CASE @update_type
		WHEN "start" THEN

			update task set started_dtm = current_timestamp where task_id = @task_id;
			insert into task_user (task_id, user_login_id, start_assignment_dtm) values (@task_id, @user_login_id, now());
			insert into work_log (task_id, user_login_id, started_work_dtm) values (@task_id, @user_login_id, now());
		WHEN "pause" THEN
			update task set paused_dtm = now()
            where task_id = @task_id;
            
            update work_log set stopped_work_dtm = now()
            where task_id = @task_id
            and stopped_work_dtm Is Null;
		WHEN "resume" THEN
			update task set paused_dtm = null
            where task_id = @task_id;

			insert into work_log (task_id, user_login_id, started_work_dtm) values (@task_id, @user_login_id, now());
		WHEN "complete" THEN
			update task set paused_dtm = null, completed_dtm = now() where task_id = @task_id;

            update work_log set stopped_work_dtm = now()
            where task_id = @task_id
            and stopped_work_dtm Is Null;
		WHEN "cancel_delete" THEN
			update task set paused_dtm = null, deleted_dtm = now() where task_id = @task_id;

            update work_log set stopped_work_dtm = now()
            where task_id = @task_id
            and stopped_work_dtm Is Null;
	END CASE;
END //
