DROP PROCEDURE IF exists p_update_item;

DELIMITER //
CREATE PROCEDURE p_update_item(IN type varchar(30), IN data JSON)
BEGIN
	set @task_id = JSON_EXTRACT(data, '$.task_id');
	CASE type
		WHEN "start" THEN
			update task set started_dtm = current_timestamp where task_id = @task_id;
		WHEN "pause" THEN
			-- This logic can not be put in the task update trigger since it is, itself, an update to the same task
            -- This logic esentially acts as a toggle for the paused state.
			select paused_dtm into @paused_dtm from task where task_id = @task_id;
            if @paused_dtm Is Null THEN
				update task set paused_dtm = now() where task_id = @task_id;
			else
				update task set paused_dtm = null where task_id = @task_id;
			END IF;
		WHEN "complete" THEN
			update task set paused_dtm = null where task_id = @task_id;
			update task set completed_dtm = current_timestamp where task_id = @task_id;
		WHEN "cancel_delete" THEN
			call p_cancel_delete_item(data);
    END CASE;
END //
DELIMITER ;