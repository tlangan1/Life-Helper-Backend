DROP PROCEDURE IF exists p_update_task;

DELIMITER //
CREATE PROCEDURE p_update_task(IN data JSON)
BEGIN
	Set @update_type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.update_type'));
	set @task_id = JSON_EXTRACT(data, '$.item_id');
	-- this is a big deal...see the BUILDING-AND-EXTRACTING-JSON.md file for more details on why this is necessary.
	set @user_login_id = CAST(JSON_EXTRACT(data, '$.user_login_id') AS UNSIGNED);

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
		WHEN "reassign" THEN
			call p_reassign_task_user(data);
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

	CALL p_get_user_working_status_today(
		@user_login_id,
		@user_working,
		@elapsed_work_time
	);
	select @user_working as user_working, @elapsed_work_time as elapsed_work_time;
END //

DELIMITER ;