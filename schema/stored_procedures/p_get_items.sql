DROP PROCEDURE IF exists p_get_items;

DELIMITER //
CREATE PROCEDURE p_get_items(IN type varchar(30), IN data JSON)
BEGIN
	set @sort = JSON_UNQUOTE(JSON_EXTRACT(data, '$.sort'));
	set @direction = JSON_UNQUOTE(JSON_EXTRACT(data, '$.direction'));
	drop temporary table if exists t1;
	drop temporary table if exists t2;
    
	CASE type
		WHEN "objectives" THEN
		    create temporary table t1 as select objective_id as item_id, objective.*
            from objective
            where if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, objective_id = JSON_EXTRACT(data, '$.item_id'));
		WHEN "goals" THEN
			create temporary table t1 as select g.goal_id as item_id, g.*
			from goal g inner join objective_goal og on g.goal_id = og.goal_id
			where og.objective_id = JSON_EXTRACT(data, '$.parent_id')
            and if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, g.goal_id = JSON_EXTRACT(data, '$.item_id'));
		WHEN "tasks" THEN
			if JSON_UNQUOTE(JSON_EXTRACT(data, '$.view')) = "my-tasks-view" THEN
				create temporary table t1 as select t.task_id as item_id, t.*, tu.user_login_id
				from task t inner join task_user tu on t.task_id = tu.task_id
				where tu.user_login_id = JSON_EXTRACT(data, '$.assigned_to')
                and tu.end_assignment_dtm Is Null
                order by tu.order_id;
            ELSE
				create temporary table t1 as select t.task_id as item_id, t.*, tu.user_login_id
				from task t inner join goal_task gt on t.task_id = gt.task_id
                left outer join task_user tu on t.task_id = tu.task_id
				where gt.goal_id = JSON_EXTRACT(data, '$.parent_id')
                and tu.end_assignment_dtm Is Null;
				-- and if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, t.task_id = JSON_EXTRACT(data, '$.item_id'));
			END IF;
		WHEN "task" THEN
			-- As of 04-24-2026 this is used in ProjectItemDetail.jsx to achieve a granular update of the task list
			-- without refreshing the entire list. This need arises when the user starts, pauses, resumes, completes
			-- or cancels a task.
			-- There is no need for an analogous "objective" or "goal" endpoint because, once created, objectives and goals
			-- are not updated by the user.
			select t.task_id as item_id, t.*, tu.user_login_id
			from task t left outer join task_user tu on t.task_id = tu.task_id
			where t.task_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "subscriptions" THEN
			select * from web_push_subscription where unsubscribed_or_expired_dtm Is Null;
		WHEN "notes" THEN
			call p_get_notes(data);
		WHEN "thoughts" THEN
			call p_get_thoughts(data);
		WHEN "user_login" THEN
			call p_get_user_login(data);
		WHEN "user_logins" THEN
			select ul.user_login_id, ul.full_name, ul.email_address, count(*) as workload
			from user_login ul inner join task_user tu on ul.user_login_id = tu.user_login_id
			inner join task t on tu.task_id = t.task_id
			where ul.deleted_dtm Is Null
			and tu.end_assignment_dtm Is Null
			and   t.completed_dtm Is Null
			and   t.canceled_dtm Is Null
			group by ul.user_login_id, ul.full_name, ul.email_address;
		WHEN "search" THEN
			call p_search_items(data);
		WHEN "user_working_status_today" THEN
			SET @user_login_id = JSON_EXTRACT(data, '$.user_login_id');
			CALL p_get_user_working_status_today(
				@user_login_id,
				@user_working,
				@elapsed_work_time
			);
			SELECT @user_working AS user_working,
				@elapsed_work_time AS elapsed_work_time;
		ELSE
		    select null;
	END CASE;
    if type = "objectives" or type = "goals" or type = "tasks" THEN
		create temporary table t2 as select * from t1
		WHERE CASE
			WHEN JSON_EXTRACT(data, '$.completed_items') = "yes" THEN completed_dtm Is Not Null
			WHEN JSON_EXTRACT(data, '$.completed_items') = "no" THEN completed_dtm Is Null
			ELSE 1 = 1
		END
		AND CASE
			WHEN JSON_EXTRACT(data, '$.started_items') = "yes" THEN started_dtm Is Not Null
			WHEN JSON_EXTRACT(data, '$.started_items') = "no" THEN started_dtm Is Null
			ELSE 1 = 1
		END
		AND CASE
			WHEN JSON_EXTRACT(data, '$.canceled_items') = "yes" THEN canceled_dtm Is Not Null
			WHEN JSON_EXTRACT(data, '$.canceled_items') = "no" THEN canceled_dtm Is Null
			ELSE 1 = 1
		END;
		
        SET @sortSQL = CONCAT('select * from t2 order by ', @sort, ' ', @direction);
		PREPARE prepared_statement FROM @sortSQL;
		EXECUTE prepared_statement;
		DEALLOCATE PREPARE prepared_statement;
    END IF;
END //
DELIMITER ;
