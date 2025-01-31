DROP PROCEDURE IF exists p_get_items;

DELIMITER //
CREATE PROCEDURE p_get_items(IN type varchar(30), IN data JSON)
BEGIN
	drop temporary table if exists t1;
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
			create temporary table t1 as select t.task_id as item_id, t.*
			from task t inner join goal_task gt on t.task_id = gt.task_id
			where gt.goal_id = JSON_EXTRACT(data, '$.parent_id')
            and if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, t.task_id = JSON_EXTRACT(data, '$.item_id'));
		WHEN "subscriptions" THEN
			select * from web_push_subscription where unsubscribed_or_expired_dtm Is Null;
		WHEN "notes" THEN
			call p_get_notes(data);
		WHEN "user_login" THEN
			call p_get_user_login(data);
	END CASE;
    if type = "objectives" or type = "goals" or type = "tasks" THEN
		select * from t1
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
		END
		order by item_name asc;
    END IF;
END //
DELIMITER ;
