DROP PROCEDURE IF exists p_update_task;

DELIMITER //
CREATE PROCEDURE p_update_task(IN data JSON)
BEGIN
	Set @update_type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.update_type'));
	set @task_id = JSON_EXTRACT(data, '$.item_id');
	set @user_login_id = JSON_EXTRACT(data, '$.user_login_id');

	CASE @update_type
		WHEN "start" THEN
			call p_update_running_task(data);

			update task set started_dtm = now(), starting_user = @user_login_id where task_id = @task_id;
			insert into task_user (task_id, user_login_id, start_assignment_dtm) values (@task_id, @user_login_id, now());
			insert into work_log (task_id, user_login_id, started_work_dtm) values (@task_id, @user_login_id, now());
		WHEN "pause" THEN
			update task set paused_dtm = now()
            where task_id = @task_id;
            
            update work_log set stopped_work_dtm = now()
            where task_id = @task_id
            and stopped_work_dtm Is Null;
		WHEN "resume" THEN
			call p_update_running_task(data);

			update task set paused_dtm = null
            where task_id = @task_id;

			insert into work_log (task_id, user_login_id, started_work_dtm) values (@task_id, @user_login_id, now());

            -- update stacked_task set order_id = order_id + 1;
            
            -- update stacked_task set order_id = 1 where stacked_task_id = @task_id;
		WHEN "complete" THEN
			update task set paused_dtm = null, completed_dtm = now(), completing_user = @user_login_id where task_id = @task_id;

            update work_log set stopped_work_dtm = now()
            where task_id = @task_id
            and stopped_work_dtm Is Null;
		WHEN "cancel" THEN
			update task set paused_dtm = null, canceled_dtm = now(), canceling_user = @user_login_id where task_id = @task_id;

            update work_log set stopped_work_dtm = now()
            where task_id = @task_id
            and stopped_work_dtm Is Null;
	END CASE;
END //

DELIMITER ;