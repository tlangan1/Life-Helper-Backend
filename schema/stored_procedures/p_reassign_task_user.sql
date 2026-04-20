DROP PROCEDURE IF exists p_reassign_task_user;

DELIMITER //
CREATE PROCEDURE p_reassign_task_user(IN data JSON)
BEGIN
	set @task_id = JSON_EXTRACT(data, '$.item_id');
	set @from_user_login_id = JSON_EXTRACT(data, '$.from_user_login_id');
	set @to_user_login_id = JSON_EXTRACT(data, '$.to_user_login_id');

	IF @task_id Is Null OR @from_user_login_id Is Null OR @to_user_login_id Is Null THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'task_id, from user id, and to user id are required for reassignment';
	END IF;

	select started_dtm, paused_dtm, completed_dtm, canceled_dtm
	into @started_dtm, @paused_dtm, @completed_dtm, @canceled_dtm
	from task
	where task_id = @task_id;

	IF @started_dtm Is Null OR @completed_dtm Is Not Null OR @canceled_dtm Is Not Null THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'task must be started and not completed/canceled to reassign';
	END IF;

    -- Code created by Copilot which should be unnecessary
    -- @from_user_login_id is provided as input so we can validate that the task
    -- is currently assigned to that user before allowing reassignment to proceed.
	select tu.user_login_id
	into @current_user_login_id
	from task_user tu
	where tu.task_id = @task_id
	and tu.end_assignment_dtm Is Null;
	-- order by tu.start_assignment_dtm desc, tu.created_dtm desc
	-- limit 1;

	IF @current_user_login_id != @from_user_login_id THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'task assignment has changed since the client last retrieved data; reassignment cannot proceed';
	END IF;

	IF @current_user_login_id = @to_user_login_id THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'task is already assigned to the requested user';
	END IF;

    -- Code created by Copilot which should be unnecessary
	-- IF EXISTS (select 1 from task_user where task_id = @task_id and user_login_id = @new_user_login_id) THEN
	-- 	SIGNAL SQLSTATE '45000'
	-- 	SET MESSAGE_TEXT = 'task has already been assigned to the requested user';
	-- END IF;

	-- If the task is running, pause it so worked time is closed for the current assignee.
	IF @paused_dtm Is Null THEN
		update task set paused_dtm = now() where task_id = @task_id;

		update work_log set stopped_work_dtm = now()
		where task_id = @task_id
		and user_login_id = @from_user_login_id
		and stopped_work_dtm Is Null;
	END IF;

	update task_user
	set end_assignment_dtm = now()
	where task_id = @task_id
	and user_login_id = @from_user_login_id
	and end_assignment_dtm Is Null;

	insert into task_user (task_id, user_login_id, start_assignment_dtm)
	values (@task_id, @to_user_login_id, now());
END //

DELIMITER ;