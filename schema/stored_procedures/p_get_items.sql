DROP PROCEDURE IF exists p_get_items;

DELIMITER //
CREATE PROCEDURE p_get_items(IN type varchar(30), IN data JSON)
BEGIN
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
				create temporary table t1 as select t.task_id as item_id, t.*
				from task t inner join task_user tu on t.task_id = tu.task_id
				where tu.user_login_id = JSON_EXTRACT(data, '$.assigned_to')
                and tu.end_assignment_dtm Is Null;
            ELSE
				create temporary table t1 as select t.task_id as item_id, t.*
				from task t inner join goal_task gt on t.task_id = gt.task_id
				where gt.goal_id = JSON_EXTRACT(data, '$.parent_id')
				and if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, t.task_id = JSON_EXTRACT(data, '$.item_id'));
			END IF;
		WHEN "subscriptions" THEN
			select * from web_push_subscription where unsubscribed_or_expired_dtm Is Null;
		WHEN "notes" THEN
			call p_get_notes(data);
		WHEN "user_login" THEN
			call p_get_user_login(data);
		WHEN "stacked_tasks" THEN
			select * from stacked_tasks where user_login_id = JSON_EXTRACT(data, '$.user_login_id')
			order by order_id;
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
			WHEN JSON_EXTRACT(data, '$.deleted_items') = "yes" THEN deleted_dtm Is Not Null
			WHEN JSON_EXTRACT(data, '$.deleted_items') = "no" THEN deleted_dtm Is Null
			ELSE 1 = 1
		END;
		Set @assigned_to = JSON_EXTRACT(data, '$.assigned_to');
		IF @assigned_to Is Null THEN
			select * from t2
			order by item_name asc;
		ELSE
			CASE type
				WHEN "objectives" THEN
					select * from t2
					where objective_id in (select o.objective_id from objective o inner join objective_goal og on t2.objective_id = og.objective_id
					inner join goal g on og.goal_id = g.goal_id
					inner join goal_task gt on gt.goal_id = g.goal_id
					inner join task t on t.task_id = gt.task_id
					inner join task_user tu on t.task_id = tu.task_id
					where tu.user_login_id = @assigned_to)
					order by item_name asc;
				WHEN "goals" THEN
					select * from t2
					where goal_id in (select g.goal_id from goal g inner join goal_task gt on t2.goal_id = gt.goal_id
					inner join task t on t.task_id = gt.task_id
					inner join task_user tu on t.task_id = tu.task_id
					where tu.user_login_id = @assigned_to)
					order by item_name asc;
				WHEN "tasks" THEN
					select * from t2
					where task_id in (select t.task_id from task t inner join task_user tu on t2.task_id = tu.task_id
					where tu.user_login_id = @assigned_to)
					order by item_name asc;
			END CASE;
		END IF;
    END IF;
END //
DELIMITER ;
